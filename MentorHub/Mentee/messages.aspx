<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="messages.aspx.cs" Inherits="MentorHub.Mentee.messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div>
            <button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button>
            <span class="fw-semibold">Messages</span>
          </div>
        </div>

        <div class="row g-4">
          <div class="col-lg-4">
            <div class="dashboard-card p-3 chat-list">
              <div class="border-bottom pb-2 mb-3">
                <h6 class="fw-semibold mb-0">Conversations</h6>
              </div>
              <div class="d-flex align-items-center p-2 rounded-3 bg-light mb-2">
                <div class="me-2"><i class="bi bi-circle-fill text-success"></i></div>
                <div>
                  <div class="fw-semibold">Daniel Ross</div>
                  <small class="text-muted">Can we discuss the next task?</small>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-8">
            <div class="dashboard-card p-3">
              <div class="border-bottom pb-2 mb-3">
                <h6 class="fw-semibold mb-0">Daniel Ross <span class="badge bg-success-subtle text-success">Online</span></h6>
              </div>
              <div class="p-2">
                <div class="chat-bubble received">I’ve shared your new learning plan.</div>
                <div class="chat-bubble sent">Perfect! I will follow it.</div>
              </div>
              <div class="border-top pt-3 mt-3">
                <div class="input-group">
                  <button class="btn btn-outline-secondary"><i class="bi bi-emoji-smile"></i></button>
                  <button class="btn btn-outline-secondary"><i class="bi bi-paperclip"></i></button>
                  <input type="text" class="form-control" placeholder="Type a message..." />
                  <button class="btn gradient-btn">Send</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
</asp:Content>
