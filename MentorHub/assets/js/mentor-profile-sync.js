(function () {
    "use strict";

    function getAvatarElements() {
        var elements = [];
        document.querySelectorAll(
            ".mp-sidebar .mp-mini-profile .mp-avatar, " +
            ".mp-sidebar-footer .mp-mini-profile .mp-avatar, " +
            ".mp-topbar .mp-avatar, " +
            ".mp-mini-photo img, .mp-mini-photo .mp-avatar, " +
            "[data-mentor-avatar]"
        ).forEach(function (el) {
            if (elements.indexOf(el) === -1) elements.push(el);
        });
        return elements;
    }

    function setAvatar(el, data) {
        var photo = data.photo || "";
        var initials = data.initials || "M";
        var name = data.name || "Mentor";

        if (el.tagName && el.tagName.toLowerCase() === "img") {
            if (photo) {
                el.src = photo + (photo.indexOf("?") >= 0 ? "&" : "?") + "v=" + Date.now();
                el.style.display = "";
            } else {
                el.removeAttribute("src");
                el.style.display = "none";
            }
            el.alt = name;
            el.title = name;
            return;
        }

        var innerImage = el.querySelector ? el.querySelector("img") : null;
        if (innerImage) {
            setAvatar(innerImage, data);
            return;
        }

        if (photo) {
            el.textContent = "";
            el.style.backgroundImage = "url('" + photo.replace(/'/g, "%27") + "?v=" + Date.now() + "')";
            el.style.backgroundSize = "cover";
            el.style.backgroundPosition = "center";
            el.style.color = "transparent";
        } else {
            el.style.backgroundImage = "none";
            el.textContent = initials;
            el.style.color = "";
        }
        el.setAttribute("aria-label", name);
        el.setAttribute("title", name);
    }

    function updateMentorName(data) {
        var name = data.name || "Mentor";

        document.querySelectorAll(
            ".mp-mini-profile-text strong, " +
            ".mp-mini-profile-text [id*='SidebarName'], " +
            ".mp-mini-profile-text [id*='MiniName'], " +
            "[data-mini-name], [data-mentor-name]"
        ).forEach(function (element) {
            element.textContent = name;
        });

        // Keep the dashboard welcome heading in sync too.
        document.querySelectorAll("[data-mentor-welcome]").forEach(function (element) {
            element.textContent = "Welcome back, " + name;
        });

        document.querySelectorAll(".mp-page-hero h1, .dashboard-welcome h1").forEach(function (element) {
            if (/^Welcome back,/i.test(element.textContent.trim())) {
                element.textContent = "Welcome back, " + name;
            }
        });
    }

    function ensureTopbarAvatar(data) {
        var topbar = document.querySelector(".mp-topbar");
        if (!topbar) return;

        var existing = topbar.querySelector(".mp-avatar, [data-mentor-avatar]");
        if (existing) return;

        var rightSide = topbar.lastElementChild;
        if (!rightSide) return;

        var avatar = document.createElement("span");
        avatar.className = "mp-avatar sm";
        avatar.setAttribute("data-mentor-avatar", "");
        avatar.style.display = "inline-flex";
        avatar.style.alignItems = "center";
        avatar.style.justifyContent = "center";
        avatar.style.cursor = "default";
        rightSide.appendChild(avatar);
        setAvatar(avatar, data);
    }

    function applyMentorProfile(data) {
        if (!data || !data.success) return;

        updateMentorName(data);
        getAvatarElements().forEach(function (avatar) {
            setAvatar(avatar, data);
        });
        ensureTopbarAvatar(data);
    }

    function loadMentorProfile() {
        var endpoint = new URL("profile-sync.ashx", window.location.href);
        endpoint.searchParams.set("_", Date.now().toString());

        fetch(endpoint.toString(), {
            method: "GET",
            credentials: "same-origin",
            cache: "no-store",
            headers: { "X-Requested-With": "XMLHttpRequest" }
        })
        .then(function (response) {
            if (!response.ok) throw new Error("Profile sync request failed.");
            return response.json();
        })
        .then(applyMentorProfile)
        .catch(function () {
            // The server-rendered fallback remains visible if sync is unavailable.
        });
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", loadMentorProfile);
    } else {
        loadMentorProfile();
    }
})();
