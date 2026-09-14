/* MentorHub Mentor Panel v2
   Clean client-side demo engine for the Mentor Web Forms pages.
   Persists UI/demo data in localStorage so interactions survive refreshes.
*/
(function () {
  'use strict';

  var KEY = 'mentorhub_mentor_panel_v2';

  var COLORS = [
    ['#6366f1', '#4338ca'], ['#ec4899', '#db2777'], ['#10b981', '#059669'],
    ['#0ea5e9', '#0284c7'], ['#f59e0b', '#d97706'], ['#8b5cf6', '#6d28d9']
  ];

  function initials(name) {
    return String(name || '').trim().split(/\s+/).filter(Boolean).slice(0, 2)
      .map(function (x) { return x.charAt(0); }).join('').toUpperCase() || 'MH';
  }

  function colorFor(name) {
    var n = 0, s = String(name || '');
    for (var i = 0; i < s.length; i++) n += s.charCodeAt(i);
    return COLORS[n % COLORS.length];
  }

  function seed() {
    return {
      mentor: {
        name: 'Daniel Ross',
        email: 'daniel@mentorhub.com',
        phone: '+91 98765 43210',
        title: 'Lead Software Engineer · 10+ Years Experience',
        bio: 'I help students and professionals improve their software engineering skills through hands-on mentorship, interview prep, and career strategy.',
        education: 'M.Tech in Computer Science',
        experience: '10+ years at Microsoft & Google',
        availability: 'Mon–Fri, 7pm–10pm',
        rating: 4.9,
        reviews: 128
      },
      skills: [
        { id: 's1', name: 'System Design', level: 'Advanced', percent: 90 },
        { id: 's2', name: 'Java & Spring', level: 'Advanced', percent: 88 },
        { id: 's3', name: 'Career Coaching', level: 'Intermediate', percent: 80 },
        { id: 's4', name: 'Python', level: 'Advanced', percent: 84 }
      ],
      availability: [
        { id: 'a1', day: 'Monday', start: '19:00', end: '21:00' },
        { id: 'a2', day: 'Wednesday', start: '20:00', end: '22:00' },
        { id: 'a3', day: 'Friday', start: '18:30', end: '20:30' },
        { id: 'a4', day: 'Saturday', start: '10:00', end: '12:00' }
      ],
      requests: [
        { id: 'r1', name: 'Naina Shah', goal: 'Career transition to product management', status: 'pending', date: '2 hours ago' },
        { id: 'r2', name: 'Rohan Verma', goal: 'Interview preparation for software jobs', status: 'accepted', date: '1 day ago' },
        { id: 'r3', name: 'Jiya Rao', goal: 'Guidance on system design fundamentals', status: 'review', date: '2 days ago' },
        { id: 'r4', name: 'Aarav Mehta', goal: 'Resume and portfolio review', status: 'pending', date: '3 days ago' }
      ],
      mentees: [
        { id: 'm1', name: 'Naina Shah', focus: 'Product Management', goal: 'Career transition into product management', lastSession: '2 days ago', sessionsCompleted: 8, progress: 72 },
        { id: 'm2', name: 'Rohan Verma', focus: 'Software Interviews', goal: 'Interview preparation and leadership coaching', lastSession: '1 week ago', sessionsCompleted: 5, progress: 54 },
        { id: 'm3', name: 'Priya Nair', focus: 'System Design', goal: 'Deep dive into distributed systems', lastSession: '4 days ago', sessionsCompleted: 11, progress: 88 }
      ],
      conversations: [
        { id: 'c1', name: 'Naina Shah', online: true, unread: 1, messages: [
          { from: 'them', text: 'Hi Daniel! Thanks again for the session yesterday.', time: '9:12 AM' },
          { from: 'me', text: 'Anytime! How did the PM case study go?', time: '9:20 AM' },
          { from: 'them', text: 'Went well, I used the framework we discussed.', time: '9:24 AM' }
        ] },
        { id: 'c2', name: 'Rohan Verma', online: false, unread: 0, messages: [
          { from: 'them', text: 'Could we push our Thursday session to Friday?', time: 'Yesterday' },
          { from: 'me', text: 'Sure, Friday 7pm works on my end.', time: 'Yesterday' }
        ] },
        { id: 'c3', name: 'Priya Nair', online: true, unread: 2, messages: [
          { from: 'them', text: 'Quick question about the CAP theorem example.', time: '8:15 AM' },
          { from: 'them', text: 'No rush, whenever you have a minute!', time: '8:16 AM' }
        ] }
      ],
      sessions: [
        { id: 'se0', date: '2026-09-08', time: '11:00 AM', title: 'Career transition strategy', mentee: 'Naina Shah', status: 'Completed' },
        { id: 'se1', date: '2026-09-24', time: '10:00 AM', title: 'Career transition strategy', mentee: 'Naina Shah', status: 'Confirmed' },
        { id: 'se2', date: '2026-09-26', time: '2:30 PM', title: 'System design mock interview', mentee: 'Rohan Verma', status: 'Confirmed' },
        { id: 'se3', date: '2026-09-29', time: '6:00 PM', title: 'Career strategy check-in', mentee: 'Priya Nair', status: 'Pending' }
      ],
      reviews: [
        { id: 'rv1', name: 'Naina Shah', rating: 5, text: 'Thoughtful, encouraging, and highly actionable.', date: '3 days ago' },
        { id: 'rv2', name: 'Rohan Verma', rating: 5, text: 'Clear explanations and excellent listening skills.', date: '1 week ago' },
        { id: 'rv3', name: 'Priya Nair', rating: 4, text: 'Great depth on system design, would love more mock interviews.', date: '2 weeks ago' }
      ],
      notifications: [
        { id: 'n1', type: 'request', text: 'A new request from Jiya Rao is waiting for your review.', time: '10 min ago', read: false },
        { id: 'n2', type: 'session', text: 'Your next session with Naina Shah is scheduled for tomorrow.', time: '2 hours ago', read: false },
        { id: 'n3', type: 'review', text: 'Rohan Verma left you a 5-star review.', time: 'Yesterday', read: true },
        { id: 'n4', type: 'message', text: 'Priya Nair sent you a new message.', time: '2 days ago', read: true }
      ],
      settings: { emailNotif: true, smsNotif: false, darkMode: false, profilePhoto: '' }
    };
  }

  function mergeDefaults(data) {
    var base = seed();
    if (!data) return base;
    Object.keys(base).forEach(function (k) {
      if (data[k] == null) data[k] = base[k];
    });
    data.mentor = Object.assign({}, base.mentor, data.mentor || {});
    data.settings = Object.assign({}, base.settings, data.settings || {});
    if (!Array.isArray(data.sessions)) data.sessions = base.sessions;
    if (!Array.isArray(data.notifications)) data.notifications = base.notifications;
    return data;
  }

  function load() {
    try {
      var raw = localStorage.getItem(KEY);
      if (raw) return mergeDefaults(JSON.parse(raw));
    } catch (e) {}
    var fresh = seed();
    save(fresh);
    return fresh;
  }

  function save(data) {
    try { localStorage.setItem(KEY, JSON.stringify(data)); } catch (e) {}
  }

  var DB = load();

  function esc(value) {
    return String(value == null ? '' : value).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  function toast(message, type) {
    var host = document.querySelector('.mp-toast-host');
    if (!host) {
      host = document.createElement('div');
      host.className = 'mp-toast-host';
      document.body.appendChild(host);
    }
    var el = document.createElement('div');
    el.className = 'mp-toast ' + (type ? 'mp-toast-' + type : '');
    var icon = type === 'success' ? 'bi-check-circle-fill' : type === 'danger' ? 'bi-x-circle-fill' : 'bi-info-circle-fill';
    el.innerHTML = '<i class="bi ' + icon + '"></i><span>' + esc(message) + '</span>';
    host.appendChild(el);
    requestAnimationFrame(function () { el.classList.add('show'); });
    setTimeout(function () {
      el.classList.remove('show');
      setTimeout(function () { if (el.parentNode) el.parentNode.removeChild(el); }, 250);
    }, 2600);
  }

  function formatTime(t) { return t || ''; }
  function formatDate(dateStr) {
    var d = new Date(dateStr + 'T12:00:00');
    return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
  }
  function fmtSlot(t) {
    var p = String(t).split(':');
    var h = parseInt(p[0], 10), m = p[1] || '00';
    return (h % 12 || 12) + ':' + m + ' ' + (h >= 12 ? 'PM' : 'AM');
  }

  function syncAvatars() {
    var name = DB.mentor.name;
    document.querySelectorAll('[data-mini-name]').forEach(function (el) { el.textContent = name; });
    document.querySelectorAll('[data-mini-avatar]').forEach(function (el) {
      if (DB.settings.profilePhoto) {
        el.innerHTML = '<img src="' + DB.settings.profilePhoto + '" alt="Profile" />';
        el.classList.add('has-photo');
      } else {
        el.textContent = initials(name);
        el.classList.remove('has-photo');
      }
    });
  }

  function syncBadges() {
    var pending = DB.requests.filter(function (r) { return r.status === 'pending'; }).length;
    var unread = DB.conversations.reduce(function (n, c) { return n + (c.unread || 0); }, 0);
    var notifs = DB.notifications.filter(function (n) { return !n.read; }).length;
    document.querySelectorAll('[data-badge="requests"]').forEach(function (e) { e.textContent = pending; e.style.display = pending ? 'inline-flex' : 'none'; });
    document.querySelectorAll('[data-badge="messages"]').forEach(function (e) { e.textContent = unread; e.style.display = unread ? 'inline-flex' : 'none'; });
    document.querySelectorAll('[data-notif-dot]').forEach(function (e) { e.style.display = notifs ? '' : 'none'; });
  }

  var notifIcons = {
    request: ['bi-ui-checks', 'mp-notif-purple'],
    session: ['bi-calendar2-check', 'mp-notif-blue'],
    review: ['bi-star-fill', 'mp-notif-amber'],
    message: ['bi-chat-dots-fill', 'mp-notif-green']
  };

  function notifHtml(n, full) {
    var meta = notifIcons[n.type] || notifIcons.request;
    return '<div class="mp-notif-item ' + (n.read ? '' : 'unread') + '" data-notif-id="' + esc(n.id) + '">' +
      '<div class="mp-notif-icon ' + meta[1] + '"><i class="bi ' + meta[0] + '"></i></div>' +
      '<div class="mp-notif-body flex-grow-1"><div class="mp-notif-text">' + esc(n.text) + '</div><div class="mp-notif-time">' + esc(n.time) + '</div></div>' +
      (full && !n.read ? '<span class="mp-unread-dot"></span>' : '') + '</div>';
  }

  function renderNotifDropdown() {
    document.querySelectorAll('[data-notif-list]').forEach(function (el) {
      el.innerHTML = DB.notifications.slice(0, 4).map(function (n) { return notifHtml(n, false); }).join('') || '<div class="mp-empty py-3">No notifications yet.</div>';
    });
  }

  function darkMode() {
    var enabled = !!DB.settings.darkMode;
    document.body.classList.toggle('mentor-dark', enabled);
    document.querySelectorAll('[data-dark-toggle]').forEach(function (t) {
      if (t.tagName === 'INPUT') t.checked = enabled;
      t.classList.toggle('is-active', enabled);
      var icon = t.querySelector('i');
      if (icon) { icon.classList.toggle('bi-moon-stars', !enabled); icon.classList.toggle('bi-sun', enabled); }
    });
  }

  function initShell() {
    syncAvatars(); syncBadges(); renderNotifDropdown(); darkMode();

    document.querySelectorAll('[data-sidebar-toggle]').forEach(function (btn) {
      btn.addEventListener('click', function (e) {
        e.preventDefault();
        var side = document.querySelector('.mp-sidebar');
        if (!side) return;
        side.classList.toggle('mp-sidebar-open');
        document.body.classList.toggle('mp-nav-open', side.classList.contains('mp-sidebar-open'));
        btn.setAttribute('aria-expanded', side.classList.contains('mp-sidebar-open') ? 'true' : 'false');
      });
    });

    document.addEventListener('click', function (e) {
      var side = document.querySelector('.mp-sidebar');
      if (window.innerWidth <= 991 && side && side.classList.contains('mp-sidebar-open') && !side.contains(e.target) && !e.target.closest('[data-sidebar-toggle]')) {
        side.classList.remove('mp-sidebar-open'); document.body.classList.remove('mp-nav-open');
      }
      var notif = e.target.closest('[data-notif-id]');
      if (notif) {
        var n = DB.notifications.find(function (x) { return x.id === notif.getAttribute('data-notif-id'); });
        if (n && !n.read) { n.read = true; save(DB); syncBadges(); renderNotifDropdown(); }
      }
    });

    document.querySelectorAll('[data-dark-toggle]').forEach(function (toggle) {
      if (toggle.dataset.darkBound) return;
      toggle.dataset.darkBound = '1';
      var handler = function () {
        var enabled = toggle.tagName === 'INPUT' ? toggle.checked : !DB.settings.darkMode;
        DB.settings.darkMode = enabled;
        save(DB); darkMode(); toast(enabled ? 'Dark mode enabled' : 'Light mode enabled');
      };
      if (toggle.tagName === 'INPUT') toggle.addEventListener('change', handler);
      else toggle.addEventListener('click', handler);
    });

    document.querySelectorAll('.mp-search input').forEach(function (input) {
      input.addEventListener('keydown', function (e) {
        if (e.key === 'Enter' && input.value.trim()) toast('Searching for “' + input.value.trim() + '”');
      });
    });

    document.querySelectorAll('[data-countup]').forEach(function (el) {
      var target = parseFloat(el.getAttribute('data-countup'));
      if (isNaN(target)) return;
      var decimals = parseInt(el.getAttribute('data-decimals') || '0', 10), start = performance.now();
      (function tick(now) {
        var p = Math.min((now - start) / 850, 1), eased = 1 - Math.pow(1 - p, 3), v = target * eased;
        el.textContent = decimals ? v.toFixed(decimals) : Math.round(v);
        if (p < 1) requestAnimationFrame(tick);
      })(start);
    });
  }

  function statusChip(status) {
    var cls = String(status || '').toLowerCase();
    if (cls === 'confirmed' || cls === 'accepted') cls = 'accepted';
    if (cls === 'completed') cls = 'completed';
    if (cls === 'pending') cls = 'pending';
    if (cls === 'rejected') cls = 'rejected';
    return '<span class="mp-chip ' + cls + '">' + esc(status) + '</span>';
  }

  var renderers = {};

  renderers.dashboard = function () {
    var pending = DB.requests.filter(function (r) { return r.status === 'pending'; }).length;
    var values = { mentees: DB.mentees.length, sessions: 6, pending: pending, completed: 48, rating: DB.mentor.rating };
    Object.keys(values).forEach(function (k) {
      var el = document.querySelector('[data-stat="' + k + '"]');
      if (el) { el.setAttribute('data-countup', values[k]); el.textContent = values[k]; }
    });
    var list = document.querySelector('[data-recent-requests]');
    if (list) list.innerHTML = DB.requests.slice(0, 4).map(function (r) {
      var c = colorFor(r.name);
      return '<li class="list-group-item d-flex align-items-center justify-content-between px-1"><div class="d-flex align-items-center gap-2"><span class="mp-avatar sm" style="background:linear-gradient(135deg,' + c[0] + ',' + c[1] + ')">' + initials(r.name) + '</span><div><div class="fw-semibold small">' + esc(r.name) + '</div><div class="text-muted small">' + esc(r.goal) + '</div></div></div>' + statusChip(r.status) + '</li>';
    }).join('');
    var feed = document.querySelector('[data-activity-feed]');
    if (feed) feed.innerHTML = DB.notifications.map(function (n) { return '<div class="mp-timeline-item"><div>' + esc(n.text) + '</div><div class="mp-timeline-time">' + esc(n.time) + '</div></div>'; }).join('');
  };

  renderers.requests = function () {
    var box = document.querySelector('[data-request-list]'), search = document.querySelector('[data-request-search]'), tabs = document.querySelectorAll('[data-request-tab]');
    if (!box) return;
    var filter = 'all';
    function draw() {
      var q = search ? search.value.toLowerCase() : '';
      var rows = DB.requests.filter(function (r) { return (filter === 'all' || r.status === filter) && (!q || (r.name + ' ' + r.goal).toLowerCase().indexOf(q) > -1); });
      box.innerHTML = rows.length ? rows.map(function (r) {
        var c = colorFor(r.name);
        var actions = r.status === 'pending' ? '<button class="mp-btn mp-btn-primary btn-sm" data-accept="' + r.id + '"><i class="bi bi-check2"></i>Accept</button><button class="mp-btn mp-btn-danger-soft btn-sm" data-reject="' + r.id + '"><i class="bi bi-x-lg"></i>Reject</button>' : '<button class="mp-btn mp-btn-outline btn-sm" data-view-request="' + r.id + '"><i class="bi bi-eye"></i>View</button>';
        return '<div class="mp-request-card fade-in d-flex flex-wrap align-items-center gap-3 justify-content-between"><div class="d-flex align-items-center gap-3"><span class="mp-avatar md" style="background:linear-gradient(135deg,' + c[0] + ',' + c[1] + ')">' + initials(r.name) + '</span><div><div class="fw-semibold">' + esc(r.name) + '</div><div class="text-muted small">' + esc(r.goal) + '</div></div></div><div class="d-flex align-items-center gap-3 flex-wrap">' + statusChip(r.status) + '<span class="text-muted small">' + esc(r.date) + '</span><div class="d-flex gap-2">' + actions + '</div></div></div>';
      }).join('') : '<div class="mp-empty"><i class="bi bi-inbox"></i>No requests match this view.</div>';
      box.querySelectorAll('[data-accept]').forEach(function (b) { b.onclick = function () { var r = DB.requests.find(function (x) { return x.id === b.dataset.accept; }); if (r) { r.status = 'accepted'; if (!DB.mentees.some(function (m) { return m.name === r.name; })) DB.mentees.push({ id: 'm' + Date.now(), name: r.name, focus: r.goal.split(' ')[0] || 'Mentoring', goal: r.goal, lastSession: 'Not started', sessionsCompleted: 0, progress: 5 }); save(DB); syncBadges(); draw(); toast(r.name + ' added to your mentees', 'success'); } }; });
      box.querySelectorAll('[data-reject]').forEach(function (b) { b.onclick = function () { var r = DB.requests.find(function (x) { return x.id === b.dataset.reject; }); if (r) { r.status = 'rejected'; save(DB); syncBadges(); draw(); toast('Request declined', 'danger'); } }; });
      box.querySelectorAll('[data-view-request]').forEach(function (b) { b.onclick = function () { var r = DB.requests.find(function (x) { return x.id === b.dataset.viewRequest; }); if (r) toast(r.name + ': ' + r.goal); }; });
    }
    tabs.forEach(function (t) { t.onclick = function () { tabs.forEach(function (x) { x.classList.remove('active'); }); t.classList.add('active'); filter = t.dataset.requestTab; draw(); }; });
    if (search) search.oninput = draw; draw();
  };

  renderers.mentees = function () {
    var grid = document.querySelector('[data-mentee-grid]'), search = document.querySelector('[data-mentee-search]'); if (!grid) return;
    function draw() {
      var q = search ? search.value.toLowerCase() : '';
      var list = DB.mentees.filter(function (m) { return !q || (m.name + ' ' + m.focus + ' ' + m.goal).toLowerCase().indexOf(q) > -1; });
      grid.innerHTML = list.map(function (m) { var c = colorFor(m.name); return '<div class="col-lg-4 col-md-6 fade-in"><div class="mp-mentee-card"><div class="d-flex align-items-center gap-3 mb-3"><span class="mp-avatar md" style="background:linear-gradient(135deg,' + c[0] + ',' + c[1] + ')">' + initials(m.name) + '</span><div><h6 class="fw-bold mb-0">' + esc(m.name) + '</h6><span class="text-muted small">' + esc(m.focus) + '</span></div><div class="mp-ring ms-auto" style="--pct:' + m.progress + '"><span>' + m.progress + '%</span></div></div><p class="text-muted small flex-grow-1">' + esc(m.goal) + '</p><div class="d-flex justify-content-between small text-muted mb-3"><span><i class="bi bi-clock-history me-1"></i>' + esc(m.lastSession) + '</span><span><i class="bi bi-check2-circle me-1"></i>' + m.sessionsCompleted + ' sessions</span></div><div class="d-flex gap-2 mt-auto"><a href="mentee-profile.aspx?id=' + encodeURIComponent(m.id) + '" class="mp-btn mp-btn-soft btn-sm flex-grow-1 justify-content-center">View Profile</a><a href="messages.aspx?open=' + encodeURIComponent('c' + (m.id === 'm1' ? '1' : m.id === 'm2' ? '2' : '3')) + '" class="mp-btn mp-btn-outline btn-sm mp-btn-icon"><i class="bi bi-chat-dots"></i></a></div></div></div>'; }).join('') || '<div class="col-12"><div class="mp-empty"><i class="bi bi-people"></i>No mentees match your search.</div></div>';
    }
    if (search) search.oninput = draw; draw();
  };

  renderers['mentee-profile'] = function () {
    var id = new URLSearchParams(location.search).get('id');
    var m = DB.mentees.find(function (x) { return x.id === id; }) || DB.mentees[0]; if (!m) return;
    var c = colorFor(m.name);
    var vals = { name: m.name, goal: m.goal, focus: m.focus, last: m.lastSession, sessions: m.sessionsCompleted, progress: m.progress + '%' };
    Object.keys(vals).forEach(function (k) { var el = document.querySelector('[data-mentee-' + k + ']'); if (el) el.textContent = vals[k]; });
    var a = document.querySelector('[data-mentee-avatar]'); if (a) { a.textContent = initials(m.name); a.style.background = 'linear-gradient(135deg,' + c[0] + ',' + c[1] + ')'; }
    var bar = document.querySelector('[data-mentee-progress-bar]'); if (bar) setTimeout(function () { bar.style.width = m.progress + '%'; }, 120);
  };

  renderers.messages = function () {
    var list = document.querySelector('[data-conv-list]'), win = document.querySelector('[data-chat-window]'), name = document.querySelector('[data-chat-name]'), status = document.querySelector('[data-chat-status]'), input = document.querySelector('[data-chat-input]'), send = document.querySelector('[data-chat-send]');
    if (!list || !win) return;
    var active = new URLSearchParams(location.search).get('open') || DB.conversations[0].id;
    function drawList() {
      list.innerHTML = DB.conversations.map(function (c) { var cc = colorFor(c.name), last = c.messages[c.messages.length - 1]; return '<div class="mp-conv-item ' + (c.id === active ? 'active' : '') + '" data-conv="' + c.id + '"><span class="mp-avatar sm" style="background:linear-gradient(135deg,' + cc[0] + ',' + cc[1] + ')">' + initials(c.name) + '</span><div class="flex-grow-1"><div class="mp-conv-name">' + esc(c.name) + '</div><div class="mp-conv-preview">' + esc(last ? last.text : '') + '</div></div>' + (c.unread ? '<span class="mp-conv-unread">' + c.unread + '</span>' : '') + '</div>'; }).join('');
      list.querySelectorAll('[data-conv]').forEach(function (el) { el.onclick = function () { active = el.dataset.conv; var c = DB.conversations.find(function (x) { return x.id === active; }); if (c) c.unread = 0; save(DB); syncBadges(); drawList(); drawChat(); }; });
    }
    function drawChat() {
      var c = DB.conversations.find(function (x) { return x.id === active; }); if (!c) return;
      if (name) name.textContent = c.name; if (status) status.innerHTML = c.online ? statusChip('Online') : statusChip('Offline');
      win.innerHTML = c.messages.map(function (m) { return '<div class="mp-chat-bubble ' + (m.from === 'me' ? 'sent' : 'received') + '">' + esc(m.text) + '<span class="mp-chat-time">' + esc(m.time) + '</span></div>'; }).join('');
      win.scrollTop = win.scrollHeight;
    }
    function sendMessage() {
      if (!input || !input.value.trim()) return; var c = DB.conversations.find(function (x) { return x.id === active; }); if (!c) return;
      var text = input.value.trim(); input.value = ''; var time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
      c.messages.push({ from: 'me', text: text, time: time }); save(DB); drawList(); drawChat();
      var typing = document.createElement('div'); typing.className = 'mp-typing'; typing.innerHTML = '<span></span><span></span><span></span>'; win.appendChild(typing); win.scrollTop = win.scrollHeight;
      setTimeout(function () { if (typing.parentNode) typing.remove(); c.messages.push({ from: 'them', text: 'Got it, thank you!', time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) }); save(DB); drawList(); drawChat(); }, 1100);
    }
    if (send) send.onclick = sendMessage; if (input) input.onkeydown = function (e) { if (e.key === 'Enter') sendMessage(); }; drawList(); drawChat();
  };

  renderers.skills = function () {
    var box = document.querySelector('[data-skills-list]'); if (!box) return;
    box.innerHTML = DB.skills.map(function (s) { return '<div class="col-lg-4 col-md-6 fade-in"><div class="mp-card p-4 h-100"><div class="d-flex justify-content-between align-items-start mb-2"><h5 class="fw-semibold mb-0">' + esc(s.name) + '</h5><span class="mp-chip accepted">' + esc(s.level) + '</span></div><div class="mp-skill-bar mt-3"><div data-pct="' + s.percent + '"></div></div><p class="text-muted mt-2 mb-0 small">' + s.percent + '% readiness</p></div></div>'; }).join('');
    setTimeout(function () { box.querySelectorAll('[data-pct]').forEach(function (b) { b.style.width = b.dataset.pct + '%'; }); }, 120);
  };

  renderers['edit-skills'] = function () {
    var wrap = document.querySelector('[data-edit-skills-form]'); if (!wrap) return;
    function draw() {
      wrap.innerHTML = DB.skills.map(function (s) { return '<div class="col-md-6"><label class="form-label">Skill</label><input class="form-control" data-skill-name value="' + esc(s.name) + '" /></div><div class="col-md-5"><label class="form-label">Readiness (%)</label><input type="number" min="0" max="100" class="form-control" data-skill-pct value="' + s.percent + '" /></div><div class="col-md-1 d-flex align-items-end"><button type="button" class="mp-btn mp-btn-danger-soft mp-btn-icon" data-remove-skill="' + s.id + '"><i class="bi bi-trash"></i></button></div>'; }).join('') + '<div class="col-12"><button type="button" class="mp-btn mp-btn-outline" data-add-skill><i class="bi bi-plus-lg"></i>Add another skill</button></div><div class="col-12"><button type="submit" class="mp-btn mp-btn-primary"><i class="bi bi-check2-circle"></i>Save Changes</button></div>';
      wrap.querySelectorAll('[data-remove-skill]').forEach(function (b) { b.onclick = function () { DB.skills = DB.skills.filter(function (s) { return s.id !== b.dataset.removeSkill; }); draw(); }; });
      var add = wrap.querySelector('[data-add-skill]'); if (add) add.onclick = function () { DB.skills.push({ id: 's' + Date.now(), name: 'New Skill', level: 'Intermediate', percent: 60 }); draw(); };
    }
    draw();
    var form = wrap.closest('form'); if (form) form.onsubmit = function (e) { e.preventDefault(); var names = form.querySelectorAll('[data-skill-name]'), pcts = form.querySelectorAll('[data-skill-pct]'); DB.skills.forEach(function (s, i) { if (names[i]) s.name = names[i].value || s.name; if (pcts[i]) s.percent = Math.max(0, Math.min(100, parseInt(pcts[i].value, 10) || 0)); s.level = s.percent >= 85 ? 'Advanced' : s.percent >= 60 ? 'Intermediate' : 'Beginner'; }); save(DB); toast('Skills updated successfully', 'success'); setTimeout(function () { location.href = 'my-skills.aspx'; }, 600); };
  };

  renderers.availability = function () {
    var grid = document.querySelector('[data-availability-grid]'); if (!grid) return;
    var days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    function draw() {
      grid.innerHTML = days.map(function (day) { var slots = DB.availability.filter(function (a) { return a.day === day; }); return '<div class="mp-day-cell ' + (slots.length ? 'has-slot' : '') + '"><div class="mp-day-name">' + day + '</div>' + (slots.length ? slots.map(function (s) { return '<span class="mp-slot-pill">' + fmtSlot(s.start) + '–' + fmtSlot(s.end) + '<i class="bi bi-x-lg" data-remove-slot="' + s.id + '"></i></span>'; }).join('') : '<div class="mp-day-empty">Not available</div>') + '</div>'; }).join('');
      grid.querySelectorAll('[data-remove-slot]').forEach(function (x) { x.onclick = function () { DB.availability = DB.availability.filter(function (a) { return a.id !== x.dataset.removeSlot; }); save(DB); draw(); toast('Availability slot removed'); }; });
    }
    draw();
  };

  renderers['add-slot'] = function () {
    var form = document.querySelector('[data-add-slot-form]'); if (!form) return;
    form.onsubmit = function (e) { e.preventDefault(); var day = form.querySelector('[name="day"]').value, start = form.querySelector('[name="start"]').value, end = form.querySelector('[name="end"]').value; if (start >= end) { toast('End time must be after start time', 'danger'); return; } DB.availability.push({ id: 'a' + Date.now(), day: day, start: start, end: end }); save(DB); sessionStorage.setItem('mpFlashMessage', 'New availability slot added'); location.href = 'availability.aspx'; };
  };

  renderers.feedback = function () {
    var list = document.querySelector('[data-review-list]'), bars = document.querySelector('[data-rating-bars]');
    if (list) list.innerHTML = DB.reviews.map(function (r) { var c = colorFor(r.name); var stars = [1,2,3,4,5].map(function (i) { return '<i class="bi ' + (i <= r.rating ? 'bi-star-fill' : 'bi-star') + '"></i>'; }).join(''); return '<div class="d-flex gap-3 py-3 border-bottom fade-in"><span class="mp-avatar sm" style="background:linear-gradient(135deg,' + c[0] + ',' + c[1] + ')">' + initials(r.name) + '</span><div><div class="d-flex align-items-center gap-2"><strong>' + esc(r.name) + '</strong><span class="mp-stars small">' + stars + '</span></div><p class="text-muted mb-1">“' + esc(r.text) + '”</p><span class="text-muted small">' + esc(r.date) + '</span></div></div>'; }).join('');
    if (bars) { var counts = [0,0,0,0,0]; DB.reviews.forEach(function (r) { counts[r.rating - 1]++; }); var total = DB.reviews.length || 1; bars.innerHTML = [5,4,3,2,1].map(function (s) { var pct = Math.round(counts[s-1] / total * 100); return '<div class="mp-rating-row"><span class="label">' + s + ' star</span><div class="mp-rating-bar"><div data-pct="' + pct + '"></div></div><span class="count">' + counts[s-1] + '</span></div>'; }).join(''); setTimeout(function () { bars.querySelectorAll('[data-pct]').forEach(function (b) { b.style.width = b.dataset.pct + '%'; }); }, 120); }
  };

  renderers.notifications = function () {
    var box = document.querySelector('[data-notif-full-list]'), mark = document.querySelector('[data-mark-all-read]'); if (!box) return;
    function draw() { box.innerHTML = DB.notifications.length ? DB.notifications.map(function (n) { return notifHtml(n, true); }).join('') : '<div class="mp-empty"><i class="bi bi-bell-slash"></i>No notifications yet.</div>'; }
    draw();
    box.onclick = function (e) { var item = e.target.closest('[data-notif-id]'); if (!item) return; var n = DB.notifications.find(function (x) { return x.id === item.dataset.notifId; }); if (n) { n.read = true; save(DB); draw(); syncBadges(); renderNotifDropdown(); } };
    if (mark) mark.onclick = function () { DB.notifications.forEach(function (n) { n.read = true; }); save(DB); draw(); syncBadges(); renderNotifDropdown(); toast('All notifications marked as read', 'success'); };
  };

  renderers.schedule = function () {
    var grid = document.querySelector('[data-cal-grid]'), label = document.querySelector('[data-cal-label]'), upcoming = document.querySelector('[data-upcoming-list]'); if (!grid) return;
    var view = new Date(2026, 8, 1), selected = new Date(2026, 8, 13);
    function key(d) { return d.getFullYear() + '-' + String(d.getMonth()+1).padStart(2,'0') + '-' + String(d.getDate()).padStart(2,'0'); }
    function daySessions(d) { return DB.sessions.filter(function (s) { return s.date === key(d); }); }
    function renderUpcoming() {
      var list = DB.sessions.filter(function (s) { return s.status !== 'Completed'; }).sort(function (a,b) { return (a.date + a.time).localeCompare(b.date + b.time); });
      if (upcoming) upcoming.innerHTML = list.length ? list.map(function (s) { return '<li class="mp-upcoming-item" data-open-session="' + s.id + '"><div class="d-flex align-items-center gap-3"><span class="mp-session-icon"><i class="bi bi-calendar2-event"></i></span><div><strong>' + esc(new Date(s.date + 'T12:00:00').getDate()) + ' — ' + esc(s.mentee) + '</strong><div class="text-muted small">' + esc(s.title) + '</div></div></div><span class="mp-session-time">' + esc(s.time) + '</span></li>'; }).join('') : '<li class="mp-empty">No upcoming sessions.</li>';
      if (upcoming) upcoming.querySelectorAll('[data-open-session]').forEach(function (x) { x.onclick = function () { var s = DB.sessions.find(function (z) { return z.id === x.dataset.openSession; }); if (s) openDay(new Date(s.date + 'T12:00:00')); }; });
    }
    function renderCalendar() {
      var y = view.getFullYear(), m = view.getMonth();
      if (label) label.textContent = view.toLocaleDateString('en-US', { month:'long', year:'numeric' });
      var first = new Date(y,m,1).getDay(), total = new Date(y,m+1,0).getDate();
      var html = '<div class="mp-cal-dow">Su</div><div class="mp-cal-dow">Mo</div><div class="mp-cal-dow">Tu</div><div class="mp-cal-dow">We</div><div class="mp-cal-dow">Th</div><div class="mp-cal-dow">Fr</div><div class="mp-cal-dow">Sa</div>';
      for (var i=0;i<first;i++) html += '<div class="mp-cal-day mp-muted"></div>';
      for (var d=1;d<=total;d++) { var date = new Date(y,m,d), k = key(date), sessions = daySessions(date), cls='mp-cal-day'; if (key(date)===key(selected)) cls += ' mp-selected'; if (key(date)===key(new Date(2026,8,13))) cls += ' mp-today'; if (sessions.length) cls += ' mp-has-session'; html += '<button type="button" class="' + cls + '" data-cal-date="' + k + '"><span>' + d + '</span>' + (sessions.length ? '<small>' + sessions.length + '</small>' : '') + '</button>'; }
      grid.innerHTML = html;
      grid.querySelectorAll('[data-cal-date]').forEach(function (b) { b.onclick = function () { selected = new Date(b.dataset.calDate + 'T12:00:00'); openDay(selected); renderCalendar(); }; });
    }
    function openDay(date) {
      var sessions = daySessions(date), modal = document.getElementById('mpDayModal'); if (!modal) return;
      modal.querySelector('[data-modal-date]').textContent = formatDate(key(date));
      var body = modal.querySelector('[data-day-sessions]');
      body.innerHTML = sessions.length ? sessions.map(function (s) { return '<div class="mp-modal-session"><div><div class="fw-semibold">' + esc(s.mentee) + '</div><div class="text-muted small">' + esc(s.title) + '</div></div><div class="text-end"><div class="mp-session-time">' + esc(s.time) + '</div>' + statusChip(s.status) + '</div></div>'; }).join('') : '<div class="mp-empty py-4"><i class="bi bi-calendar2-x"></i>No sessions scheduled for this day.</div>';
      var add = modal.querySelector('[data-schedule-this-day]'); if (add) add.onclick = function () { closeModal(modal); openAddModal(key(date)); };
      if (window.bootstrap && bootstrap.Modal) bootstrap.Modal.getOrCreateInstance(modal).show();
    }
    function closeModal(modal) { if (window.bootstrap && bootstrap.Modal) bootstrap.Modal.getOrCreateInstance(modal).hide(); }
    function openAddModal(date) { var modal = document.getElementById('mpAddSessionModal'); if (!modal) return; modal.querySelector('[name="date"]').value = date || key(selected); if (window.bootstrap && bootstrap.Modal) bootstrap.Modal.getOrCreateInstance(modal).show(); }
    var prev = document.querySelector('[data-cal-prev]'), next = document.querySelector('[data-cal-next]'), today = document.querySelector('[data-cal-today]'), addTop = document.querySelector('[data-add-session]');
    if (prev) prev.onclick = function () { view.setMonth(view.getMonth()-1); renderCalendar(); };
    if (next) next.onclick = function () { view.setMonth(view.getMonth()+1); renderCalendar(); };
    if (today) today.onclick = function () { view = new Date(2026,8,1); selected = new Date(2026,8,13); renderCalendar(); };
    if (addTop) addTop.onclick = function () { openAddModal(key(selected)); };
    var addForm = document.querySelector('[data-add-session-form]');
    if (addForm) addForm.onsubmit = function (e) { e.preventDefault(); var date = addForm.querySelector('[name="date"]').value, time = addForm.querySelector('[name="time"]').value, mentee = addForm.querySelector('[name="mentee"]').value, title = addForm.querySelector('[name="title"]').value || 'Mentoring Session'; if (!date || !time || !mentee) return; DB.sessions.push({ id:'se' + Date.now(), date:date, time:fmtSlot(time), title:title, mentee:mentee, status:'Confirmed' }); save(DB); var modal=document.getElementById('mpAddSessionModal'); if (window.bootstrap && bootstrap.Modal) bootstrap.Modal.getOrCreateInstance(modal).hide(); renderCalendar(); renderUpcoming(); toast('Session scheduled successfully', 'success'); };
    document.getElementById('mpJoinMeetingBtn') && (document.getElementById('mpJoinMeetingBtn').onclick = function () { var text = 'https://meet.mentorhub.local/session'; if (navigator.clipboard) navigator.clipboard.writeText(text).catch(function(){}); toast('Meeting link copied to clipboard', 'success'); });
    renderCalendar(); renderUpcoming();
  };

  renderers.profile = function () {
    var m = DB.mentor;
    var map = { name:m.name, title:m.title, bio:m.bio, education:m.education, experience:m.experience, skills:DB.skills.slice(0,3).map(function(s){return s.name;}).join(', '), availability:m.availability, rating:m.rating, reviews:m.reviews };
    Object.keys(map).forEach(function(k){ var e=document.querySelector('[data-profile-' + k + ']'); if(e)e.textContent=map[k]; });
    var wrap = document.querySelector('[data-photo-key]'), img = wrap ? wrap.querySelector('img') : null;
    if (img && DB.settings.profilePhoto) { img.src = DB.settings.profilePhoto; img.classList.remove('profile-photo-empty'); }
    if (wrap && img && !wrap.dataset.photoBound) {
      wrap.dataset.photoBound='1'; var input=document.createElement('input'); input.type='file'; input.accept='image/*'; input.hidden=true; wrap.appendChild(input); var btn=wrap.querySelector('.photo-edit-btn'); if(btn)btn.onclick=function(){input.click();}; input.onchange=function(){var f=input.files[0]; if(!f)return; var r=new FileReader(); r.onload=function(){DB.settings.profilePhoto=r.result;save(DB);img.src=r.result;img.classList.remove('profile-photo-empty');syncAvatars();toast('Profile photo updated','success');};r.readAsDataURL(f);};
    }
    var edit=document.querySelector('[data-edit-profile-btn]'), modal=document.getElementById('mpEditProfileModal');
    if(edit&&modal&&window.bootstrap&&!edit.dataset.bound){ edit.dataset.bound='1'; var bm=bootstrap.Modal.getOrCreateInstance(modal); edit.onclick=function(){modal.querySelector('[name="name"]').value=m.name;modal.querySelector('[name="title"]').value=m.title;modal.querySelector('[name="bio"]').value=m.bio;bm.show();}; var form=modal.querySelector('form'); form.onsubmit=function(e){e.preventDefault();m.name=form.querySelector('[name="name"]').value.trim()||m.name;m.title=form.querySelector('[name="title"]').value.trim()||m.title;m.bio=form.querySelector('[name="bio"]').value.trim()||m.bio;save(DB);bm.hide();syncAvatars();renderers.profile();toast('Profile updated','success');}; }
  };

  renderers.settings = function () {
    var form=document.querySelector('[data-settings-form]');
    if(form){
      var name=form.querySelector('[name="displayName"]'), email=form.querySelector('[name="email"]'), phone=form.querySelector('[name="phone"]');
      if(name)name.value=DB.mentor.name;if(email)email.value=DB.mentor.email;if(phone)phone.value=DB.mentor.phone||'';
      if(!form.dataset.bound)form.dataset.bound='1',form.onsubmit=function(e){e.preventDefault();DB.mentor.name=name.value.trim()||DB.mentor.name;DB.mentor.email=email.value.trim()||DB.mentor.email;DB.mentor.phone=phone?phone.value.trim():DB.mentor.phone;save(DB);syncAvatars();toast('Preferences saved','success');};
    }
    var et=document.querySelector('[data-email-toggle]'), st=document.querySelector('[data-sms-toggle]'); if(et){et.checked=!!DB.settings.emailNotif;et.onchange=function(){DB.settings.emailNotif=et.checked;save(DB);toast(et.checked?'Email notifications enabled':'Email notifications disabled');};} if(st){st.checked=!!DB.settings.smsNotif;st.onchange=function(){DB.settings.smsNotif=st.checked;save(DB);toast(st.checked?'SMS notifications enabled':'SMS notifications disabled');};}
    var photoBtn=document.querySelector('[data-settings-photo-btn]'), photoInput=document.querySelector('[data-settings-photo-input]'), photo=document.querySelector('[data-settings-photo]');
    if(photo){
      if(DB.settings.profilePhoto){ photo.src=DB.settings.profilePhoto; photo.style.display='block'; var fb=document.querySelector('[data-settings-photo-fallback]'); if(fb)fb.style.display='none'; }
      else { photo.style.display='none'; var fb2=document.querySelector('[data-settings-photo-fallback]'); if(fb2)fb2.textContent=initials(DB.mentor.name); }
    }
    if(photoBtn&&photoInput&&!photoBtn.dataset.bound){photoBtn.dataset.bound='1';photoBtn.onclick=function(){photoInput.click();};photoInput.onchange=function(){var f=photoInput.files[0];if(!f)return;var r=new FileReader();r.onload=function(){DB.settings.profilePhoto=r.result;save(DB);if(photo)photo.src=r.result; photo.style.display='block'; var fb3=document.querySelector('[data-settings-photo-fallback]'); if(fb3)fb3.style.display='none'; syncAvatars();toast('Profile photo updated','success');};r.readAsDataURL(f);};}
    var sec=document.querySelector('[data-security-form]'); if(sec&&!sec.dataset.bound){sec.dataset.bound='1';sec.onsubmit=function(e){e.preventDefault();var n=sec.querySelector('[name="newPassword"]');if(!n||n.value.length<6){toast('Use at least 6 characters','danger');return;}n.value='';var c=sec.querySelector('[name="currentPassword"]');if(c)c.value='';toast('Password updated successfully','success');};}
    var reset=document.querySelector('[data-reset-demo]'); if(reset)reset.onclick=function(){if(confirm('Reset MentorHub demo data to the original sample?')){DB=seed();save(DB);location.reload();}};
  };

  function initFlash(){var f=sessionStorage.getItem('mpFlashMessage');if(f){sessionStorage.removeItem('mpFlashMessage');toast(f,'success');}}

  document.addEventListener('DOMContentLoaded', function () {
    initShell();
    var page=document.body.getAttribute('data-page');
    if(renderers[page]){try{renderers[page]();}catch(e){console.error('MentorHub panel error',e);}}
    syncAvatars();syncBadges();renderNotifDropdown();initFlash();
  });

  window.MentorApp = {
    db: DB,
    save: function(){save(DB);syncAvatars();syncBadges();renderNotifDropdown();},
    toast: toast,
    initials: initials,
    colorFor: colorFor,
    reset: function(){DB=seed();save(DB);location.reload();}
  };
})();
