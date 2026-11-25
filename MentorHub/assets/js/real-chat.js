
/* =========================================================
   MENTORHUB - REAL DATABASE CHAT
   Mentor-side messaging system
   Database: SQL Server
   Table: dbo.MentorMessages

   Features:
   - Loads all accepted mentee conversations
   - Loads previous message history
   - Sends messages to SQL Server
   - Refreshes incoming messages automatically
   - Displays unread message counts
   - No fake replies or localStorage chat messages
========================================================= */

(function () {
    "use strict";

    document.addEventListener("DOMContentLoaded", function () {

        const conversationList =
            document.querySelector("[data-conv-list]");

        const chatWindow =
            document.querySelector("[data-chat-window]");

        const chatName =
            document.querySelector("[data-chat-name]");

        const chatStatus =
            document.querySelector("[data-chat-status]");

        const chatInput =
            document.querySelector("[data-chat-input]");

        const sendButton =
            document.querySelector("[data-chat-send]");

        const searchInput =
            document.getElementById("msFilter");

        if (!conversationList || !chatWindow ||
            !chatInput || !sendButton) {
            return;
        }

        let conversations = [];
        let activeMenteeId = 0;
        let isSending = false;
        let refreshTimer = null;

        /* =====================================================
           API CONNECTION
        ===================================================== */

        function api(method, data) {

            return fetch("messages.aspx/" + method, {
                method: "POST",
                credentials: "same-origin",

                headers: {
                    "Content-Type":
                        "application/json; charset=utf-8"
                },

                body: JSON.stringify(data || {})

            })
                .then(function (response) {

                    if (!response.ok) {
                        throw new Error(
                            "Server error: " + response.status
                        );
                    }

                    return response.json();

                })
                .then(function (result) {

                    if (!result ||
                        !Object.prototype.hasOwnProperty.call(
                            result, "d"
                        )) {
                        throw new Error(
                            "Invalid server response."
                        );
                    }

                    return result.d;
                });
        }

        /* =====================================================
           HELPERS
        ===================================================== */

        function createElement(tag, className, value) {

            const element =
                document.createElement(tag);

            if (className) {
                element.className = className;
            }

            if (value !== undefined &&
                value !== null) {
                element.textContent = value;
            }

            return element;
        }

        function getInitials(name) {

            return String(name || "Mentee")
                .trim()
                .split(/\s+/)
                .slice(0, 2)
                .map(function (word) {
                    return word.charAt(0);
                })
                .join("")
                .toUpperCase();
        }

        function formatTime(value) {

            if (!value) return "";

            const date = new Date(
                value.replace(" ", "T")
            );

            if (isNaN(date.getTime())) {
                return "";
            }

            return date.toLocaleTimeString([], {
                hour: "2-digit",
                minute: "2-digit"
            });
        }

        function showError(message) {

            if (!chatStatus) return;

            chatStatus.textContent = message;
            chatStatus.classList.add("text-danger");
        }

        function clearError() {

            if (!chatStatus) return;

            chatStatus.classList.remove("text-danger");
        }

        /* =====================================================
           LOAD CONVERSATIONS FROM SQL SERVER
        ===================================================== */

        function loadConversations(selectFirst) {

            return api("GetConversations", {})

                .then(function (data) {

                    conversations = data || [];

                    drawConversationList();

                    if (conversations.length === 0) {

                        activeMenteeId = 0;

                        chatName.textContent =
                            "No conversations";

                        chatStatus.textContent =
                            "Accepted mentees will appear here.";

                        chatInput.disabled = true;
                        sendButton.disabled = true;

                        chatWindow.innerHTML = "";

                        const empty = createElement(
                            "div",
                            "mp-chat-empty"
                        );

                        empty.appendChild(
                            createElement(
                                "i",
                                "bi bi-chat-square-text"
                            )
                        );

                        empty.appendChild(
                            createElement(
                                "strong",
                                "",
                                "No conversations available"
                            )
                        );

                        empty.appendChild(
                            createElement(
                                "span",
                                "",
                                "You do not have any accepted mentee conversations yet."
                            )
                        );

                        chatWindow.appendChild(empty);

                        return;
                    }

                    const exists = conversations.some(
                        function (item) {
                            return Number(item.MenteeId) ===
                                activeMenteeId;
                        }
                    );

                    if (selectFirst || !exists) {

                        const params =
                            new URLSearchParams(
                                window.location.search
                            );

                        const requestedId =
                            Number(params.get("menteeId") || 0);

                        const requested = conversations.find(
                            function (item) {
                                return Number(item.MenteeId) ===
                                    requestedId;
                            }
                        );

                        const selected = requested ||
                            conversations[0];

                        openConversation(
                            Number(selected.MenteeId)
                        );

                    } else {

                        drawConversationList();
                    }
                })

                .catch(function (error) {

                    showError(
                        error.message ||
                        "Unable to load conversations."
                    );

                    console.error(error);
                });
        }

        /* =====================================================
           DRAW CONVERSATION LIST
        ===================================================== */

        function drawConversationList() {

            conversationList.innerHTML = "";

            const search = searchInput
                ? searchInput.value.trim().toLowerCase()
                : "";

            const filtered = conversations.filter(
                function (item) {

                    return (
                        String(item.Name || "")
                            .toLowerCase()
                            .includes(search) ||

                        String(item.LastMessage || "")
                            .toLowerCase()
                            .includes(search)
                    );
                }
            );

            if (filtered.length === 0) {

                const empty = createElement(
                    "div",
                    "mp-conv-empty"
                );

                empty.appendChild(
                    createElement(
                        "i",
                        "bi bi-search"
                    )
                );

                empty.appendChild(
                    createElement(
                        "strong",
                        "",
                        "No conversations found"
                    )
                );

                empty.appendChild(
                    createElement(
                        "span",
                        "",
                        "Try searching another mentee."
                    )
                );

                conversationList.appendChild(empty);

                return;
            }

            filtered.forEach(function (item) {

                const menteeId =
                    Number(item.MenteeId);

                const conversation =
                    createElement(
                        "button",
                        "mp-conv-item" +
                        (
                            menteeId === activeMenteeId
                                ? " active"
                                : ""
                        )
                    );

                conversation.type = "button";

                const avatar = createElement(
                    "span",
                    "mp-avatar sm",
                    getInitials(item.Name)
                );

                const details = createElement(
                    "span",
                    "mp-conv-text"
                );

                const name = createElement(
                    "span",
                    "mp-conv-name",
                    item.Name
                );

                const preview = createElement(
                    "span",
                    "mp-conv-preview",
                    item.LastMessage ||
                    "Start a conversation"
                );

                const right = createElement(
                    "span",
                    "d-flex flex-column align-items-end gap-1"
                );

                const time = createElement(
                    "span",
                    "mp-conv-time",
                    formatTime(item.LastSentAt)
                );

                details.appendChild(name);
                details.appendChild(preview);

                right.appendChild(time);

                if (Number(item.UnreadCount) > 0) {

                    right.appendChild(
                        createElement(
                            "span",
                            "mp-conv-unread",
                            String(item.UnreadCount)
                        )
                    );
                }

                conversation.appendChild(avatar);
                conversation.appendChild(details);
                conversation.appendChild(right);

                conversation.addEventListener(
                    "click",
                    function () {
                        openConversation(menteeId);
                    }
                );

                conversationList.appendChild(conversation);
            });
        }

        /* =====================================================
           OPEN SELECTED CONVERSATION
        ===================================================== */

        function openConversation(menteeId) {

            const selected = conversations.find(
                function (item) {
                    return Number(item.MenteeId) ===
                        Number(menteeId);
                }
            );

            if (!selected) return;

            activeMenteeId = Number(menteeId);

            chatName.textContent = selected.Name;

            chatStatus.textContent =
                "Connected to MentorHub messaging";

            chatInput.disabled = false;
            sendButton.disabled = false;

            clearError();

            drawConversationList();

            loadMessages();
        }

        /* =====================================================
           LOAD PREVIOUS MESSAGES FROM SQL SERVER
        ===================================================== */

        function loadMessages() {

            if (!activeMenteeId) return;

            const currentId = activeMenteeId;

            return api("GetMessages", {
                menteeId: currentId
            })

                .then(function (messages) {

                    // Prevent an old request from replacing
                    // the messages of a newly selected mentee.
                    if (currentId !== activeMenteeId) {
                        return;
                    }

                    clearError();

                    drawMessages(messages || []);

                    // Refresh the preview and unread count.
                    return api("GetConversations", {});

                })

                .then(function (items) {

                    if (!items || currentId !== activeMenteeId) {
                        return;
                    }

                    conversations = items;

                    drawConversationList();
                })

                .catch(function (error) {

                    showError(
                        error.message ||
                        "Unable to load previous messages."
                    );

                    console.error(error);
                });
        }

        /* =====================================================
           DISPLAY CHAT MESSAGES
        ===================================================== */

        function drawMessages(messages) {

            chatWindow.innerHTML = "";

            if (!messages || messages.length === 0) {

                const empty = createElement(
                    "div",
                    "mp-chat-empty"
                );

                empty.appendChild(
                    createElement(
                        "i",
                        "bi bi-chat-square-dots"
                    )
                );

                empty.appendChild(
                    createElement(
                        "strong",
                        "",
                        "Start your conversation"
                    )
                );

                empty.appendChild(
                    createElement(
                        "span",
                        "",
                        "Send your first message to your mentee."
                    )
                );

                chatWindow.appendChild(empty);

                return;
            }

            messages.forEach(function (message) {

                const bubble = createElement(
                    "div",
                    "mp-chat-bubble " +
                    (
                        message.IsMine
                            ? "sent"
                            : "received"
                    )
                );

                const text = createElement(
                    "span",
                    "mp-chat-message-text",
                    message.Text
                );

                const time = createElement(
                    "span",
                    "mp-chat-time",
                    message.Time
                );

                bubble.appendChild(text);
                bubble.appendChild(time);

                chatWindow.appendChild(bubble);
            });

            chatWindow.scrollTop =
                chatWindow.scrollHeight;
        }

        /* =====================================================
           SEND REAL MESSAGE TO SQL SERVER
        ===================================================== */

        function sendMessage() {

            if (isSending || !activeMenteeId) {
                return;
            }

            const message = chatInput.value.trim();

            if (!message) {
                return;
            }

            if (message.length > 2000) {

                showError(
                    "Maximum 2000 characters allowed."
                );

                return;
            }

            const selectedMenteeId =
                activeMenteeId;

            isSending = true;

            sendButton.disabled = true;
            chatInput.disabled = true;

            clearError();

            api("SendMessage", {

                menteeId: selectedMenteeId,
                message: message

            })

                .then(function (result) {

                    if (!result || !result.Success) {

                        throw new Error(
                            result && result.Message
                                ? result.Message
                                : "Message could not be saved."
                        );
                    }

                    // Clear only after the server confirms saving.
                    chatInput.value = "";

                    return loadMessages();
                })

                .catch(function (error) {

                    showError(
                        error.message ||
                        "Message sending failed."
                    );

                    console.error(error);
                })

                .finally(function () {

                    isSending = false;

                    chatInput.disabled =
                        !activeMenteeId;

                    sendButton.disabled =
                        !activeMenteeId;

                    chatInput.focus();
                });
        }

        /* =====================================================
           EVENTS
        ===================================================== */

        sendButton.addEventListener(
            "click",
            sendMessage
        );

        chatInput.addEventListener(
            "keydown",
            function (event) {

                if (
                    event.key === "Enter" &&
                    !event.shiftKey
                ) {

                    event.preventDefault();

                    sendMessage();
                }
            }
        );

        if (searchInput) {

            searchInput.addEventListener(
                "input",
                drawConversationList
            );
        }

        /* =====================================================
           INITIAL LOAD
        ===================================================== */

        loadConversations(true);

        /* =====================================================
           AUTOMATIC REFRESH
           Only fetches actual database messages.
           It never generates an automatic reply.
        ===================================================== */

        refreshTimer = window.setInterval(
            function () {

                if (
                    !document.hidden &&
                    activeMenteeId &&
                    !isSending
                ) {

                    loadMessages();
                }

            },
            4000
        );

        window.addEventListener(
            "beforeunload",
            function () {

                if (refreshTimer) {
                    window.clearInterval(refreshTimer);
                }
            }
        );

    });

})();

/* =========================================================
   MENTORHUB - MENTEE REAL DATABASE CHAT
   API: messages.aspx WebMethods
   Database: dbo.MentorMessages
========================================================= */

(function () {
    "use strict";

    document.addEventListener("DOMContentLoaded", function () {

        const conversationList = document.querySelector("[data-conv-list]");
        const chatWindow = document.querySelector("[data-chat-window]");
        const chatName = document.querySelector("[data-chat-name]");
        const chatStatus = document.querySelector("[data-chat-status]");
        const chatInput = document.querySelector("[data-chat-input]");
        const sendButton = document.querySelector("[data-chat-send]");
        const searchInput = document.getElementById("msFilter");

        if (!conversationList || !chatWindow ||
            !chatName || !chatStatus ||
            !chatInput || !sendButton) {
            return;
        }

        let conversations = [];
        let activeMentorID = 0;
        let isSending = false;
        let refreshTimer = null;

        // =========================================
        // ASP.NET WEBMETHOD API
        // =========================================

        function api(method, data) {

            return fetch("messages.aspx/" + method, {
                method: "POST",
                credentials: "same-origin",
                headers: {
                    "Content-Type": "application/json; charset=utf-8"
                },
                body: JSON.stringify(data || {})
            })
                .then(async function (response) {

                    const result = await response.json();

                    if (!response.ok) {
                        throw new Error(
                            result.Message || result.MessageDetail ||
                            "Server error: " + response.status
                        );
                    }

                    if (!Object.prototype.hasOwnProperty.call(result, "d")) {
                        throw new Error("Invalid server response.");
                    }

                    return result.d;
                });
        }

        // =========================================
        // HELPERS
        // =========================================

        function element(tag, className, text) {

            const el = document.createElement(tag);

            if (className) el.className = className;

            if (text !== undefined && text !== null) {
                el.textContent = text;
            }

            return el;
        }

        function initials(name) {

            return String(name || "Mentor")
                .trim()
                .split(/\s+/)
                .slice(0, 2)
                .map(function (word) {
                    return word.charAt(0);
                })
                .join("")
                .toUpperCase();
        }

        function formatTime(value) {

            if (!value) return "";

            const date = new Date(
                String(value).replace(" ", "T")
            );

            if (isNaN(date.getTime())) return "";

            return date.toLocaleTimeString([], {
                hour: "2-digit",
                minute: "2-digit"
            });
        }

        function showError(message) {
            chatStatus.textContent = message;
            chatStatus.classList.add("text-danger");
        }

        function clearError() {
            chatStatus.classList.remove("text-danger");
        }

        // =========================================
        // LOAD CONVERSATIONS
        // =========================================

        function loadConversations(selectFirst) {

            return api("GetConversations", {})
                .then(function (data) {

                    conversations = data || [];

                    drawConversations();

                    if (conversations.length === 0) {

                        activeMentorID = 0;

                        chatName.textContent = "No conversations";
                        chatStatus.textContent =
                            "Your accepted mentors will appear here.";

                        chatInput.disabled = true;
                        sendButton.disabled = true;

                        chatWindow.innerHTML = "";

                        chatWindow.appendChild(
                            element(
                                "div",
                                "mp-chat-empty",
                                "No accepted mentor conversations found."
                            )
                        );

                        return;
                    }

                    const exists = conversations.some(function (item) {
                        return Number(item.MentorID) === activeMentorID;
                    });

                    if (selectFirst || !exists) {

                        const params = new URLSearchParams(
                            window.location.search
                        );

                        const requestedID = Number(
                            params.get("mentorId") || 0
                        );

                        const selected = conversations.find(function (item) {
                            return Number(item.MentorID) === requestedID;
                        }) || conversations[0];

                        openConversation(Number(selected.MentorID));
                    }
                })
                .catch(function (error) {
                    showError(error.message || "Unable to load conversations.");
                    console.error("GetConversations:", error);
                });
        }

        // =========================================
        // DRAW CONVERSATION LIST
        // =========================================

        function drawConversations() {

            conversationList.innerHTML = "";

            const search = searchInput
                ? searchInput.value.trim().toLowerCase()
                : "";

            const filtered = conversations.filter(function (item) {

                return String(item.FullName || "")
                    .toLowerCase().includes(search);
            });

            if (filtered.length === 0) {

                conversationList.appendChild(
                    element(
                        "div",
                        "mp-conv-empty",
                        "No mentor conversations found."
                    )
                );

                return;
            }

            filtered.forEach(function (item) {

                const mentorID = Number(item.MentorID);

                const button = element(
                    "button",
                    "mp-conv-item" +
                    (mentorID === activeMentorID ? " active" : "")
                );

                button.type = "button";
                button.style.width = "100%";
                button.style.border = "0";
                button.style.background =
                    mentorID === activeMentorID
                        ? "rgba(87,53,232,.12)"
                        : "transparent";
                button.style.textAlign = "left";

                const avatar = element(
                    "span",
                    "mp-avatar sm",
                    initials(item.FullName)
                );

                const details = element("span", "mp-conv-text");

                const name = element(
                    "span",
                    "mp-conv-name",
                    item.FullName || "Mentor"
                );

                const preview = element(
                    "span",
                    "mp-conv-preview",
                    item.LastMessage || "Start a conversation"
                );

                const right = element(
                    "span",
                    "d-flex flex-column align-items-end gap-1"
                );

                const time = element(
                    "span",
                    "mp-conv-time",
                    formatTime(item.LastMessageTime)
                );

                details.appendChild(name);
                details.appendChild(preview);

                right.appendChild(time);

                if (Number(item.UnreadCount) > 0) {
                    right.appendChild(
                        element(
                            "span",
                            "mp-conv-unread",
                            String(item.UnreadCount)
                        )
                    );
                }

                button.appendChild(avatar);
                button.appendChild(details);
                button.appendChild(right);

                button.addEventListener("click", function () {
                    openConversation(mentorID);
                });

                conversationList.appendChild(button);
            });
        }

        // =========================================
        // OPEN CONVERSATION
        // =========================================

        function openConversation(mentorID) {

            const selected = conversations.find(function (item) {
                return Number(item.MentorID) === Number(mentorID);
            });

            if (!selected) return;

            activeMentorID = Number(mentorID);

            // IMPORTANT: Use FullName from your C# DTO.
            chatName.textContent = selected.FullName;

            chatStatus.textContent =
                "Connected to MentorHub messaging";

            chatInput.disabled = false;
            sendButton.disabled = false;

            clearError();
            drawConversations();

            loadMessages();
        }

        // =========================================
        // LOAD CHAT HISTORY
        // =========================================

        function loadMessages() {

            if (!activeMentorID) return Promise.resolve();

            const currentMentorID = activeMentorID;

            return api("GetMessages", {
                mentorID: currentMentorID
            })
                .then(function (messages) {

                    if (currentMentorID !== activeMentorID) return;

                    drawMessages(messages || []);

                    return api("MarkMessagesRead", {
                        mentorID: currentMentorID
                    });
                })
                .then(function () {

                    if (currentMentorID !== activeMentorID) return;

                    return api("GetConversations", {});
                })
                .then(function (items) {

                    if (!items || currentMentorID !== activeMentorID) return;

                    conversations = items;
                    drawConversations();

                    const selected = conversations.find(function (item) {
                        return Number(item.MentorID) === activeMentorID;
                    });

                    if (selected) {
                        chatName.textContent = selected.FullName;
                    }
                })
                .catch(function (error) {
                    showError(error.message || "Unable to load messages.");
                    console.error("GetMessages:", error);
                });
        }

        // =========================================
        // DISPLAY MESSAGES
        // =========================================

        function drawMessages(messages) {

            chatWindow.innerHTML = "";

            if (!messages || messages.length === 0) {

                chatWindow.appendChild(
                    element(
                        "div",
                        "mp-chat-empty",
                        "Start your conversation with your mentor."
                    )
                );

                return;
            }

            messages.forEach(function (message) {

                const isMine =
                    String(message.SenderType).toLowerCase() === "mentee";

                const bubble = element(
                    "div",
                    "mp-chat-bubble " +
                    (isMine ? "sent" : "received")
                );

                const text = element(
                    "span",
                    "mp-chat-message-text",
                    message.MessageText
                );

                const time = element(
                    "span",
                    "mp-chat-time",
                    formatTime(message.SentAt)
                );

                bubble.appendChild(text);
                bubble.appendChild(time);

                chatWindow.appendChild(bubble);
            });

            chatWindow.scrollTop = chatWindow.scrollHeight;
        }

        // =========================================
        // SEND MESSAGE
        // =========================================

        function sendMessage() {

            if (isSending || !activeMentorID) return;

            const message = chatInput.value.trim();

            if (!message) return;

            if (message.length > 2000) {
                showError("Maximum 2000 characters allowed.");
                return;
            }

            isSending = true;
            sendButton.disabled = true;
            chatInput.disabled = true;

            clearError();

            api("SendMessage", {
                mentorID: activeMentorID,
                messageText: message
            })
                .then(function (result) {

                    if (!result || !result.Success) {
                        throw new Error(
                            result && result.Message
                                ? result.Message
                                : "Message could not be sent."
                        );
                    }

                    chatInput.value = "";

                    return loadMessages();
                })
                .catch(function (error) {
                    showError(error.message || "Message sending failed.");
                    console.error("SendMessage:", error);
                })
                .finally(function () {

                    isSending = false;

                    chatInput.disabled = !activeMentorID;
                    sendButton.disabled = !activeMentorID;

                    chatInput.focus();
                });
        }

        // =========================================
        // EVENTS
        // =========================================

        sendButton.addEventListener("click", sendMessage);

        chatInput.addEventListener("keydown", function (event) {

            if (event.key === "Enter" && !event.shiftKey) {
                event.preventDefault();
                sendMessage();
            }
        });

        if (searchInput) {
            searchInput.addEventListener("input", drawConversations);
        }

        // =========================================
        // INITIAL LOAD
        // =========================================

        loadConversations(true);

        // Refresh actual database messages every 4 seconds.
        refreshTimer = window.setInterval(function () {

            if (!document.hidden && activeMentorID && !isSending) {
                loadMessages();
            }

        }, 4000);

        window.addEventListener("beforeunload", function () {
            if (refreshTimer) {
                window.clearInterval(refreshTimer);
            }
        });

    });

})();
