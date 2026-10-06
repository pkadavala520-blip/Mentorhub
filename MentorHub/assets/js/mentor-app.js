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



/* ==========================================================================
   MENTORHUB - PREMIUM MOTION + 3D LAYER  ("Aurora Glass")
   --------------------------------------------------------------------------
   Purely visual. It never reads/writes form values, never touches ids, never
   intercepts clicks/submits, and removes every class/inline style it adds once
   an effect finishes. Safe to delete without affecting any page logic.
   Self-guarded: appended to both main.js and mentor-app.js, runs only once.
   ========================================================================== */
(function () {
  "use strict";
  if (window.__mhPremium) return;
  window.__mhPremium = true;

  var reduce = window.matchMedia && matchMedia("(prefers-reduced-motion: reduce)").matches;
  var fine = window.matchMedia && matchMedia("(hover: hover) and (pointer: fine)").matches;
  var doc = document, root = doc.documentElement;

  var REVEAL = ".glass-card,.dashboard-card,.people-card,.testimonial-card,.match-card,.mentor-card,.timeline-card," +
    ".faq-stat-card,.accordion-item,.section-title,.page-header,.stat-block,.suggested-mentor,.table-responsive," +
    ".mp-card,.mp-stat,.mp-panel,.mp-request-card,.mp-mentee-card,.mp-page-head,.mp-hero";
  var TILT = ".glass-card,.dashboard-card,.people-card,.testimonial-card,.match-card,.mentor-card,.suggested-mentor," +
    ".mp-stat,.mp-mentee-card,.mp-request-card";
  var MAGNET = "a.gradient-btn,button.gradient-btn,a.btn-primary,button.btn-primary,a.mp-btn-primary,button.mp-btn-primary,a.btn-outline-primary";
  var RIPPLE = "a.btn,button.btn,a.mp-btn,button.mp-btn,a.gradient-btn,button.gradient-btn";

  var mouse = { x: 0, y: 0, nx: 0, ny: 0 };

  function ready(fn) {
    if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", fn);
    else fn();
  }

  /* ---------------- atmosphere: font, aurora, progress, cursor glow ---------------- */
  function atmosphere() {
    if (!doc.querySelector('link[href*="family=Sora"]')) {
      var f = doc.createElement("link");
      f.rel = "stylesheet";
      f.href = "https://fonts.googleapis.com/css2?family=Sora:wght@500;600;700;800&display=swap";
      doc.head.appendChild(f);
    }
    var a = doc.createElement("div");
    a.className = "pm-aurora";
    a.setAttribute("aria-hidden", "true");
    a.innerHTML = "<i></i><i></i><i></i>";
    doc.body.appendChild(a);

    var bar = doc.createElement("div");
    bar.className = "pm-progress";
    bar.setAttribute("aria-hidden", "true");
    doc.body.appendChild(bar);

    var glow = null;
    if (fine && !reduce) {
      glow = doc.createElement("div");
      glow.className = "pm-cursor-glow";
      glow.setAttribute("aria-hidden", "true");
      doc.body.appendChild(glow);
    }

    var ticking = false;
    function onScroll() {
      if (ticking) return;
      ticking = true;
      requestAnimationFrame(function () {
        var h = root.scrollHeight - window.innerHeight;
        var p = h > 0 ? Math.min(1, Math.max(0, window.pageYOffset / h)) : 0;
        bar.style.transform = "scaleX(" + p.toFixed(4) + ")";
        var nav = doc.querySelector(".navbar");
        if (nav) nav.classList.toggle("pm-scrolled", window.pageYOffset > 24);
        ticking = false;
      });
    }
    window.addEventListener("scroll", onScroll, { passive: true });
    window.addEventListener("resize", onScroll, { passive: true });
    onScroll();

    var pend = false;
    window.addEventListener("pointermove", function (e) {
      if (e.pointerType && e.pointerType !== "mouse") return;
      mouse.x = e.clientX; mouse.y = e.clientY;
      mouse.nx = (e.clientX / window.innerWidth) * 2 - 1;
      mouse.ny = (e.clientY / window.innerHeight) * 2 - 1;
      if (pend) return;
      pend = true;
      requestAnimationFrame(function () {
        pend = false;
        root.style.setProperty("--px", mouse.nx.toFixed(3));
        root.style.setProperty("--py", mouse.ny.toFixed(3));
        if (glow) {
          glow.style.transform = "translate3d(" + mouse.x + "px," + mouse.y + "px,0)";
          glow.classList.add("is-on");
        }
      });
    }, { passive: true });
    doc.addEventListener("mouseleave", function () { if (glow) glow.classList.remove("is-on"); });
  }

  /* ---------------- scroll reveal ---------------- */
  var io = null;
  function revealNow(el, delay) {
    el.style.setProperty("--pm-d", delay + "ms");
    el.classList.add("pm-in");
    setTimeout(function () {
      el.classList.remove("pm-pre", "pm-in");
      el.style.removeProperty("--pm-d");
    }, delay + 1250);
  }
  function setupReveal(el, idx) {
    if (reduce) return;
    if (el.getAttribute("data-pm-rv")) return;
    if (el.closest(".modal, .modal-dialog, .dropdown-menu, .sidebar, .mp-sidebar, [hidden]")) return;
    if (el.classList.contains("fade-in") || el.classList.contains("fade-up")) return;
    var p = el.parentElement;
    if (p && p.closest("[data-pm-rv], .fade-in, .fade-up")) return;
    el.setAttribute("data-pm-rv", "1");
    var r = el.getBoundingClientRect();
    if (r.width === 0 && r.height === 0) { el.removeAttribute("data-pm-rv"); return; }
    el.classList.add("pm-pre");
    var delay = Math.min(idx * 70, 420);
    if (r.top < window.innerHeight * 0.96 && r.bottom > 0) {
      requestAnimationFrame(function () { requestAnimationFrame(function () { revealNow(el, delay); }); });
    } else if (io) {
      el.__pmDelay = delay;
      io.observe(el);
    } else {
      revealNow(el, 0);
    }
  }

  /* ---------------- 3D tilt ---------------- */
  function setupTilt(el) {
    if (!fine || reduce || el.getAttribute("data-pm-tilt")) return;
    if (el.closest(".modal, .sidebar, .mp-sidebar, .hero-image-frame")) return;
    if (el.querySelector("input,select,textarea,table,canvas,iframe")) return;
    var cs = getComputedStyle(el);
    if (cs.position !== "static" && cs.position !== "relative") return;
    var w = el.offsetWidth, h = el.offsetHeight;
    if (w < 140 || w > 560 || h > 560) return;
    el.setAttribute("data-pm-tilt", "1");
    el.classList.add("pm-tilt");
    var after = getComputedStyle(el, "::after").content;
    if (!after || after === "none" || after === "normal") el.classList.add("pm-glare");
    var rect = null;
    el.addEventListener("pointerenter", function (e) {
      if (e.pointerType && e.pointerType !== "mouse") return;
      rect = el.getBoundingClientRect();
      el.classList.add("pm-tilting");
    });
    el.addEventListener("pointermove", function (e) {
      if (!rect) return;
      var x = (e.clientX - rect.left) / rect.width;
      var y = (e.clientY - rect.top) / rect.height;
      var rx = (0.5 - y) * 9, ry = (x - 0.5) * 11;
      el.style.transform = "perspective(900px) rotateX(" + rx.toFixed(2) + "deg) rotateY(" + ry.toFixed(2) + "deg) translateY(-6px)";
      el.style.setProperty("--mx", (x * 100).toFixed(1) + "%");
      el.style.setProperty("--my", (y * 100).toFixed(1) + "%");
    });
    el.addEventListener("pointerleave", function () {
      rect = null;
      el.classList.remove("pm-tilting");
      el.style.transform = "";
    });
  }

  /* ---------------- magnetic buttons + ripple ---------------- */
  function setupMagnet(el) {
    if (!fine || reduce || el.getAttribute("data-pm-mag")) return;
    if (el.closest(".sidebar, .mp-sidebar")) return;
    el.setAttribute("data-pm-mag", "1");
    el.addEventListener("pointermove", function (e) {
      var r = el.getBoundingClientRect();
      var x = (e.clientX - (r.left + r.width / 2)) / r.width;
      var y = (e.clientY - (r.top + r.height / 2)) / r.height;
      el.style.translate = (x * 9).toFixed(1) + "px " + (y * 7).toFixed(1) + "px";
    });
    el.addEventListener("pointerleave", function () { el.style.translate = ""; });
  }
  function setupRipple(el) {
    if (reduce || el.getAttribute("data-pm-rip")) return;
    if (el.matches(".btn-close,.navbar-toggler,.accordion-button,.dropdown-toggle")) return;
    el.setAttribute("data-pm-rip", "1");
    el.addEventListener("pointerdown", function (e) {
      if (getComputedStyle(el).position === "static") el.style.position = "relative";
      var wrap = doc.createElement("span");
      wrap.className = "pm-ripple-wrap";
      wrap.setAttribute("aria-hidden", "true");
      var r = el.getBoundingClientRect();
      var d = Math.max(r.width, r.height) * 2.2;
      var s = doc.createElement("span");
      s.className = "pm-ripple";
      s.style.width = s.style.height = d + "px";
      s.style.left = (e.clientX - r.left - d / 2) + "px";
      s.style.top = (e.clientY - r.top - d / 2) + "px";
      wrap.appendChild(s);
      el.appendChild(wrap);
      setTimeout(function () { if (wrap.parentNode) wrap.parentNode.removeChild(wrap); }, 750);
    });
  }

  /* ---------------- 3D particle globe (hero / sign-in / dashboard banners) ----------------
     Dense dot-matrix Earth with pseudo-continents, graticule, glowing connection arcs
     (mentor <-> mentee routes) with travelling pulses, pulsing city nodes and two orbit rings.
     Pure canvas 2D. Eased in on load, parallax with the pointer, pauses off-screen. */
  var scenes = [];
  var looping = false;
  var PI2 = Math.PI * 2;
  var CITIES = [[23.0, 72.6], [51.5, -0.1], [40.7, -74.0], [37.8, -122.4], [1.3, 103.8], [-33.9, 151.2],
    [25.2, 55.3], [52.5, 13.4], [-23.5, -46.6], [35.7, 139.7], [-1.3, 36.8], [43.7, -79.4]];
  var ROUTES = [[0, 1], [0, 4], [0, 6], [1, 2], [2, 3], [4, 5], [9, 3], [7, 10], [8, 2], [6, 7], [9, 4], [11, 1], [0, 9]];

  function llToVec(lat, lon) {
    var a = lat * Math.PI / 180, o = lon * Math.PI / 180;
    return [Math.cos(a) * Math.sin(o), -Math.sin(a), Math.cos(a) * Math.cos(o)];
  }
  function landMask(la, lo) {
    var v = Math.sin(lo * 2.1 + 0.6) * Math.cos(la * 2.6) +
      0.7 * Math.sin(lo * 4.3 - 1.2) * Math.sin(la * 3.1 + 0.4) +
      0.5 * Math.cos(lo * 1.3 + la * 1.7);
    return v > 0.5;
  }

  function Scene(host, opt) {
    this.host = host;
    this.opt = opt;
    this.cv = doc.createElement("canvas");
    this.cv.className = "pm-scene";
    this.cv.setAttribute("aria-hidden", "true");
    host.insertBefore(this.cv, host.firstChild);
    host.classList.add("pm-has-scene");
    if (getComputedStyle(host).position === "static") host.style.position = "relative";
    this.ctx = this.cv.getContext("2d");
    this.visible = true;
    this.rx = 0.38; this.ry = -0.5;
    this.fc = 0;
    this.t0 = (window.performance && performance.now) ? performance.now() : 0;
    this.last = 0;
    this.build();
    this.resize();
  }
  Scene.prototype.build = function () {
    var N = this.opt.n || 640, i, j, k, ga = Math.PI * (3 - Math.sqrt(5));
    var dots = [];
    for (i = 0; i < N; i++) {
      var y = 1 - (i / (N - 1)) * 2, r = Math.sqrt(1 - y * y), th = ga * i;
      var x = Math.cos(th) * r, z = Math.sin(th) * r;
      dots.push({ v: [x, y, z], land: landMask(Math.asin(-y), Math.atan2(x, z)), ph: Math.random() * PI2 });
    }
    this.dots = dots;

    var grid = [], line;
    var lats = [-60, -30, 0, 30, 60];
    for (i = 0; i < lats.length; i++) {
      line = [];
      for (j = 0; j <= 72; j++) line.push(llToVec(lats[i], j * 5));
      grid.push(line);
    }
    for (i = 0; i < 12; i++) {
      line = [];
      for (j = 0; j <= 36; j++) line.push(llToVec(-90 + j * 5, i * 30));
      grid.push(line);
    }
    this.grid = grid;

    var nodes = [];
    for (i = 0; i < CITIES.length; i++) nodes.push(llToVec(CITIES[i][0], CITIES[i][1]));
    this.nodes = nodes;

    var arcs = [], M = 44;
    for (i = 0; i < ROUTES.length; i++) {
      var A = nodes[ROUTES[i][0]], B = nodes[ROUTES[i][1]];
      var dot = Math.max(-1, Math.min(1, A[0] * B[0] + A[1] * B[1] + A[2] * B[2]));
      var om = Math.acos(dot), so = Math.sin(om) || 1, pts = [];
      var lift = 0.16 + 0.26 * (om / Math.PI);
      for (k = 0; k <= M; k++) {
        var tt = k / M, wa = Math.sin((1 - tt) * om) / so, wb = Math.sin(tt * om) / so;
        var s = 1 + lift * Math.sin(Math.PI * tt);
        pts.push([(A[0] * wa + B[0] * wb) * s, (A[1] * wa + B[1] * wb) * s, (A[2] * wa + B[2] * wb) * s]);
      }
      arcs.push({ pts: pts, sp: 0.6 + (i % 5) * 0.14, off: (i * 0.173) % 1 });
    }
    this.arcs = arcs;

    this.rings = this.opt.rings === false ? [] : [
      { tilt: 0.9, rot: 0.0, speed: 0.00004, rad: 1.42, n: 80, sat: 2 },
      { tilt: -0.5, rot: 1.6, speed: -0.000028, rad: 1.72, n: 100, sat: 3 }
    ];

    var stars = [];
    if (this.opt.dark && this.opt.stars !== false) {
      for (i = 0; i < 46; i++) stars.push({ x: Math.random(), y: Math.random(), r: 0.5 + Math.random() * 1.1, ph: Math.random() * PI2 });
    }
    this.stars = stars;
  };
  Scene.prototype.resize = function () {
    var dpr = Math.min(window.devicePixelRatio || 1, 2);
    var w = this.host.clientWidth, h = this.host.clientHeight;
    this.w = w; this.h = h; this.dpr = dpr;
    this.cv.width = Math.max(1, Math.floor(w * dpr));
    this.cv.height = Math.max(1, Math.floor(h * dpr));
  };
  Scene.prototype.project = function (x, y, z, cx, cy, R) {
    var cr = Math.cos(this.ry), sr = Math.sin(this.ry), cx2 = Math.cos(this.rx), sx = Math.sin(this.rx);
    var x1 = x * cr + z * sr, z1 = -x * sr + z * cr;
    var y1 = y * cx2 - z1 * sx, z2 = y * sx + z1 * cx2;
    var s = 3.4 / (3.4 + z2);
    return [cx + x1 * R * s, cy + y1 * R * s, z2, s];
  };
  Scene.prototype.draw = function (t) {
    var o = this.opt, ctx = this.ctx;
    if (!this.host.clientWidth || !this.host.clientHeight) return;
    if ((this.fc++ & 31) === 0 && (this.host.clientWidth !== this.w || this.host.clientHeight !== this.h)) this.resize();
    var w = this.w, h = this.h, dpr = this.dpr;
    if (!w || !h) return;
    var dt = this.last ? Math.min(48, t - this.last) : 0;
    this.last = t;
    var born = Math.min(1, Math.max(0, (t - this.t0) / 1700));
    var ease = 1 - Math.pow(1 - born, 3);
    var dark = !!o.dark, a = (o.alpha || 1) * ease;

    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    ctx.clearRect(0, 0, w, h);

    var wide = w >= 992;
    var cx = o.cx !== undefined ? w * o.cx : (wide ? w * 0.74 : w * 0.5);
    var cy = o.cy !== undefined ? h * o.cy : (wide ? h * 0.5 : h * 0.3);
    var R = Math.min(h * (o.rh || 0.4), w * (o.rw || 0.3), o.max || 300) * (0.78 + 0.22 * ease);
    var sc = Math.max(0.7, Math.min(1.5, R / 170));

    this.ry += dt * 0.00019 + (mouse.nx || 0) * 0.00004 * dt;
    this.rx += ((0.34 + (mouse.ny || 0) * 0.16) - this.rx) * 0.05;

    var i, j, p, q, g;
    var col = dark
      ? { dot: "255,255,255", acc: "240,171,252", acc2: "125,211,252", halo: "196,181,253", line: "255,255,255" }
      : { dot: "99,70,235", acc: "217,70,239", acc2: "14,165,233", halo: "124,58,237", line: "99,70,235" };

    /* stars */
    for (i = 0; i < this.stars.length; i++) {
      var st = this.stars[i];
      var tw = 0.35 + 0.65 * Math.abs(Math.sin(t * 0.0011 + st.ph));
      ctx.fillStyle = "rgba(255,255,255," + (0.5 * tw * a).toFixed(3) + ")";
      ctx.beginPath(); ctx.arc(st.x * w, st.y * h, st.r * sc, 0, PI2); ctx.fill();
    }

    /* atmosphere halo */
    g = ctx.createRadialGradient(cx, cy, R * 0.55, cx, cy, R * 1.95);
    g.addColorStop(0, "rgba(" + col.halo + "," + (0.36 * a).toFixed(3) + ")");
    g.addColorStop(0.5, "rgba(" + col.halo + "," + (0.10 * a).toFixed(3) + ")");
    g.addColorStop(1, "rgba(" + col.halo + ",0)");
    ctx.fillStyle = g; ctx.beginPath(); ctx.arc(cx, cy, R * 1.95, 0, PI2); ctx.fill();

    /* sphere body */
    g = ctx.createRadialGradient(cx - R * 0.35, cy - R * 0.42, R * 0.08, cx, cy, R * 1.05);
    if (dark) {
      g.addColorStop(0, "rgba(255,255,255," + (0.20 * a).toFixed(3) + ")");
      g.addColorStop(0.55, "rgba(139,92,246," + (0.16 * a).toFixed(3) + ")");
      g.addColorStop(1, "rgba(20,10,80," + (0.34 * a).toFixed(3) + ")");
    } else {
      g.addColorStop(0, "rgba(196,181,253," + (0.34 * a).toFixed(3) + ")");
      g.addColorStop(0.6, "rgba(139,92,246," + (0.10 * a).toFixed(3) + ")");
      g.addColorStop(1, "rgba(79,70,229," + (0.10 * a).toFixed(3) + ")");
    }
    ctx.fillStyle = g; ctx.beginPath(); ctx.arc(cx, cy, R * 1.0, 0, PI2); ctx.fill();

    /* limb glow */
    g = ctx.createRadialGradient(cx, cy, R * 0.84, cx, cy, R * 1.04);
    g.addColorStop(0, "rgba(" + col.line + ",0)");
    g.addColorStop(0.85, "rgba(" + col.line + "," + ((dark ? 0.20 : 0.16) * a).toFixed(3) + ")");
    g.addColorStop(1, "rgba(" + col.line + ",0)");
    ctx.fillStyle = g; ctx.beginPath(); ctx.arc(cx, cy, R * 1.04, 0, PI2); ctx.fill();

    /* graticule (front side only, one stroke) */
    ctx.lineWidth = 0.8;
    ctx.strokeStyle = "rgba(" + col.line + "," + ((dark ? 0.13 : 0.12) * a).toFixed(3) + ")";
    ctx.beginPath();
    for (i = 0; i < this.grid.length; i++) {
      var ln = this.grid[i], pen = false;
      for (j = 0; j < ln.length; j++) {
        p = this.project(ln[j][0], ln[j][1], ln[j][2], cx, cy, R);
        if (p[2] < 0.06) { if (!pen) { ctx.moveTo(p[0], p[1]); pen = true; } else ctx.lineTo(p[0], p[1]); }
        else pen = false;
      }
    }
    ctx.stroke();

    /* dot-matrix surface */
    for (i = 0; i < this.dots.length; i++) {
      var d = this.dots[i];
      p = this.project(d.v[0], d.v[1], d.v[2], cx, cy, R);
      var f = Math.max(0, Math.min(1, (1 - p[2]) / 2));
      var base = d.land ? 1 : 0.72;
      var al = (0.10 + Math.pow(f, 1.5) * 0.9) * base * a;
      if (d.land) al *= 0.82 + 0.18 * Math.sin(t * 0.002 + d.ph);
      if (al < 0.03) continue;
      var rad = (d.land ? 1.6 : 1.15) * (0.6 + f * 1.25) * p[3] * sc;
      ctx.fillStyle = (d.land && f > 0.55 ? "rgba(" + col.dot + "," : "rgba(" + (dark ? "216,200,255" : "139,92,246") + ",") + al.toFixed(3) + ")";
      ctx.beginPath(); ctx.arc(p[0], p[1], rad, 0, PI2); ctx.fill();
    }

    /* connection arcs + travelling pulses */
    ctx.lineWidth = 1.15 * sc;
    for (i = 0; i < this.arcs.length; i++) {
      var arc = this.arcs[i], ap = arc.pts, pr = [], pen2 = false;
      ctx.strokeStyle = "rgba(" + col.acc + "," + (0.62 * a).toFixed(3) + ")";
      ctx.beginPath();
      for (j = 0; j < ap.length; j++) {
        p = this.project(ap[j][0], ap[j][1], ap[j][2], cx, cy, R);
        pr.push(p);
        if (p[2] < 0.12) { if (!pen2) { ctx.moveTo(p[0], p[1]); pen2 = true; } else ctx.lineTo(p[0], p[1]); }
        else pen2 = false;
      }
      ctx.stroke();
      var head = ((t * 0.00028 * arc.sp + arc.off) % 1) * (pr.length - 1);
      for (j = 0; j < 7; j++) {
        var idx = Math.floor(head) - j;
        if (idx < 0 || idx >= pr.length) continue;
        q = pr[idx];
        if (q[2] > 0.12) continue;
        var fade = 1 - j / 7;
        var gr = (j === 0 ? 9 : 3.4) * sc * (0.6 + fade * 0.6);
        g = ctx.createRadialGradient(q[0], q[1], 0, q[0], q[1], gr);
        g.addColorStop(0, (dark ? "rgba(255,255,255," : "rgba(" + col.acc + ",") + (0.95 * fade * a).toFixed(3) + ")");
        g.addColorStop(1, "rgba(" + col.acc + ",0)");
        ctx.fillStyle = g; ctx.beginPath(); ctx.arc(q[0], q[1], gr, 0, PI2); ctx.fill();
      }
    }

    /* city nodes */
    for (i = 0; i < this.nodes.length; i++) {
      var nv = this.nodes[i];
      p = this.project(nv[0], nv[1], nv[2], cx, cy, R);
      if (p[2] > 0.1) continue;
      var rr = ((t * 0.0011 + i * 0.37) % 1);
      ctx.strokeStyle = "rgba(" + col.acc2 + "," + ((1 - rr) * 0.7 * a).toFixed(3) + ")";
      ctx.lineWidth = 1;
      ctx.beginPath(); ctx.arc(p[0], p[1], (3 + rr * 15) * sc, 0, PI2); ctx.stroke();
      g = ctx.createRadialGradient(p[0], p[1], 0, p[0], p[1], 11 * sc);
      g.addColorStop(0, "rgba(" + col.acc2 + "," + (0.6 * a).toFixed(3) + ")");
      g.addColorStop(1, "rgba(" + col.acc2 + ",0)");
      ctx.fillStyle = g; ctx.beginPath(); ctx.arc(p[0], p[1], 11 * sc, 0, PI2); ctx.fill();
      ctx.fillStyle = dark ? "rgba(255,255,255," + (0.98 * a).toFixed(3) + ")" : "rgba(" + col.acc2 + "," + (0.95 * a).toFixed(3) + ")";
      ctx.beginPath(); ctx.arc(p[0], p[1], (i === 0 ? 3.6 : 2.3) * sc, 0, PI2); ctx.fill();
    }

    /* orbit rings + satellites */
    for (var r = 0; r < this.rings.length; r++) {
      var ring = this.rings[r];
      ring.rot += ring.speed * (dt || 16);
      var ct = Math.cos(ring.tilt), stl = Math.sin(ring.tilt);
      for (i = 0; i < ring.n; i++) {
        var ang = (i / ring.n) * PI2 + ring.rot;
        var x0 = Math.cos(ang) * ring.rad, z0 = Math.sin(ang) * ring.rad;
        var y0 = z0 * stl; z0 = z0 * ct;
        p = this.project(x0, y0, z0, cx, cy, R);
        var f2 = Math.max(0, Math.min(1, 1 - (p[2] + 1.7) / 3.4));
        ctx.fillStyle = "rgba(" + (dark ? "255,255,255" : "124,58,237") + "," + ((0.08 + f2 * 0.42) * a).toFixed(3) + ")";
        ctx.beginPath(); ctx.arc(p[0], p[1], (0.8 + f2 * 1.2) * sc, 0, PI2); ctx.fill();
      }
      for (var sIdx = 0; sIdx < ring.sat; sIdx++) {
        var ang2 = (sIdx / ring.sat) * PI2 + ring.rot * 1.6;
        var xs = Math.cos(ang2) * ring.rad, zs = Math.sin(ang2) * ring.rad;
        var ys = zs * stl; zs = zs * ct;
        p = this.project(xs, ys, zs, cx, cy, R);
        var fs = Math.max(0, Math.min(1, 1 - (p[2] + 1.7) / 3.4));
        var gr2 = (13 + fs * 9) * sc;
        g = ctx.createRadialGradient(p[0], p[1], 0, p[0], p[1], gr2);
        g.addColorStop(0, dark ? "rgba(255,255,255," + (0.95 * a).toFixed(3) + ")" : "rgba(217,70,239," + (0.85 * a).toFixed(3) + ")");
        g.addColorStop(0.35, dark ? "rgba(196,181,253," + (0.38 * a).toFixed(3) + ")" : "rgba(124,58,237," + (0.3 * a).toFixed(3) + ")");
        g.addColorStop(1, "rgba(124,58,237,0)");
        ctx.fillStyle = g; ctx.beginPath(); ctx.arc(p[0], p[1], gr2, 0, PI2); ctx.fill();
      }
    }
  };

  function loop(t) {
    var any = false;
    for (var i = 0; i < scenes.length; i++) {
      if (scenes[i].visible && doc.body.contains(scenes[i].host)) { scenes[i].draw(t); any = true; }
    }
    if (any && !doc.hidden) requestAnimationFrame(loop); else looping = false;
  }
  function kick() { if (!looping) { looping = true; requestAnimationFrame(loop); } }

  var sceneIO = null;
  function setupScene(host, opt) {
    if (host.getAttribute("data-pm-scene")) return;
    if (!doc.createElement("canvas").getContext) return;
    host.setAttribute("data-pm-scene", "1");
    var sc = new Scene(host, opt);
    scenes.push(sc);
    if (reduce) { sc.draw(sc.t0 + 4000); return; } /* one calm static frame */
    if (sceneIO) { host.__pmScene = sc; sceneIO.observe(host); }
    kick();
  }

  /* ---------------- safety net: white-on-white call-to-action cards ---------------- */
  function lumOf(c) {
    var m = (c || "").match(/[\d.]+/g);
    if (!m || m.length < 3) return 0;
    if (m.length > 3 && parseFloat(m[3]) === 0) return 0;
    return (0.2126 * m[0] + 0.7152 * m[1] + 0.0722 * m[2]) / 255;
  }
  function markDarkCards() {
    var cards = doc.querySelectorAll(".glass-card, .dashboard-card, .hero-card");
    for (var i = 0; i < cards.length; i++) {
      var el = cards[i];
      if (el.getAttribute("data-pm-dk")) continue;
      el.setAttribute("data-pm-dk", "1");
      if (el.closest(".sidebar, .footer, .navbar, .mp-sidebar, .auth-side, .modal")) continue;
      var h = el.querySelector("h1, h2, h3, h4");
      var own = lumOf(getComputedStyle(el).color);
      var hl = h ? lumOf(getComputedStyle(h).color) : 0;
      if (own > 0.88 || hl > 0.88) el.classList.add("pm-on-dark");
    }
  }

  /* ---------------- images: graceful loading + initials fallback ---------------- */
  function initialsOf(n) {
    var p = (n || "").replace(/[^A-Za-z\u00C0-\u024F ]/g, " ").trim().split(/\s+/);
    return ((p[0] || "?").charAt(0) + (p[1] ? p[1].charAt(0) : "")).toUpperCase();
  }
  function avatarURI(name, size) {
    var h = 0, i;
    for (i = 0; i < name.length; i++) h = (h * 31 + name.charCodeAt(i)) % 360;
    var h1 = 236 + (h % 58), h2 = h1 + 34, s = size || 128;
    var svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128" width="' + s + '" height="' + s + '">' +
      '<defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="hsl(' + h1 + ',82%,64%)"/>' +
      '<stop offset="1" stop-color="hsl(' + h2 + ',74%,42%)"/></linearGradient>' +
      '<radialGradient id="s" cx=".3" cy=".25" r=".8"><stop offset="0" stop-color="#fff" stop-opacity=".35"/><stop offset="1" stop-color="#fff" stop-opacity="0"/></radialGradient></defs>' +
      '<rect width="128" height="128" fill="url(#g)"/><rect width="128" height="128" fill="url(#s)"/>' +
      '<text x="50%" y="50%" dy=".35em" text-anchor="middle" font-family="Poppins,Arial,sans-serif" font-weight="700" font-size="50" fill="#fff">' +
      initialsOf(name) + "</text></svg>";
    return "data:image/svg+xml;utf8," + encodeURIComponent(svg);
  }
  function nameNear(el) {
    var box = el.closest(".suggested-mentor, .people-card, .match-card, .mentor-card, .dashboard-card") || el.parentElement;
    var n = box && box.querySelector("h5, h6, strong, .fw-bold, .fw-semibold");
    return (n && n.textContent.trim()) || el.getAttribute("alt") || "MH";
  }
  function enhanceImages() {
    var imgs = doc.querySelectorAll("img.people-card-photo, .match-card img, .mentor-card img, .hero-image-frame img");
    var i, img;
    for (i = 0; i < imgs.length; i++) {
      img = imgs[i];
      if (img.getAttribute("data-pm-img")) continue;
      img.setAttribute("data-pm-img", "1");
      (function (im) {
        if (!im.complete) {
          im.classList.add("pm-img-loading");
          im.addEventListener("load", function () { im.classList.remove("pm-img-loading"); }, { once: true });
          setTimeout(function () { im.classList.remove("pm-img-loading"); }, 4000);
        }
        im.addEventListener("error", function () {
          if (im.getAttribute("data-pm-fb")) return;
          im.setAttribute("data-pm-fb", "1");
          im.classList.remove("pm-img-loading");
          im.src = avatarURI(nameNear(im), 512);
        });
      })(img);
    }
    /* placeholder silhouettes in "Suggested mentors" become clean initials avatars */
    var cards = doc.querySelectorAll(".suggested-mentor");
    for (i = 0; i < cards.length; i++) {
      var av = cards[i].querySelector(".suggested-mentor-avatar");
      if (!av || av.tagName !== "IMG" || av.getAttribute("data-pm-av")) continue;
      av.setAttribute("data-pm-av", "1");
      var src = av.getAttribute("src") || "";
      if (!src || /^data:image\/svg/i.test(src) || /\.svg(\?|$)/i.test(src)) av.src = avatarURI(nameNear(av), 128);
    }
  }

  /* ---------------- dashboards (Admin + Mentee) ---------------- */
  function countUp(el) {
    if (reduce || el.getAttribute("data-pm-cu")) return;
    var raw = el.textContent.trim();
    var m = raw.match(/^(\D{0,3})(\d[\d,]*(?:\.\d+)?)(\D{0,3})$/);
    if (!m) return;
    el.setAttribute("data-pm-cu", "1");
    var pre = m[1], num = parseFloat(m[2].replace(/,/g, "")), suf = m[3];
    var dec = (m[2].split(".")[1] || "").length, comma = m[2].indexOf(",") > -1;
    if (isNaN(num)) return;
    function fmt(v) {
      var s = v.toFixed(dec);
      if (comma) s = Number(s).toLocaleString("en-US", { minimumFractionDigits: dec, maximumFractionDigits: dec });
      return pre + s + suf;
    }
    var t0 = null, dur = 1500;
    function step(ts) {
      if (t0 === null) t0 = ts;
      var pp = Math.min(1, (ts - t0) / dur), e = 1 - Math.pow(1 - pp, 4);
      el.textContent = pp < 1 ? fmt(num * e) : raw;
      if (pp < 1) requestAnimationFrame(step);
    }
    el.textContent = fmt(0);
    requestAnimationFrame(step);
  }

  var KPI_ICONS = [
    [/my mentor/, "bi-person-hearts"], [/pending/, "bi-hourglass-split"], [/upcoming/, "bi-calendar-event"],
    [/completed/, "bi-check2-circle"], [/learning progress|progress/, "bi-graph-up-arrow"],
    [/messages?/, "bi-chat-dots"], [/goals?/, "bi-bullseye"]
  ];

  function enhanceDashboard() {
    if (!doc.querySelector(".sidebar:not(.mp-sidebar)")) return;
    var area = doc.querySelector(".content-area");
    if (!area) return;
    area.classList.add("pm-dash");

    var top = area.querySelector(".topbar");
    if (top && !top.getAttribute("data-pm-top")) {
      top.setAttribute("data-pm-top", "1");
      var title = top.querySelector(":scope > div > .fw-semibold, :scope > .fw-semibold");
      if (title) {
        var sub = doc.createElement("div");
        sub.className = "pm-topbar-sub";
        try {
          sub.textContent = new Date().toLocaleDateString(undefined, { weekday: "long", day: "numeric", month: "long", year: "numeric" });
        } catch (e) { sub.textContent = new Date().toDateString(); }
        if (title.parentElement === top) {
          var wrap = doc.createElement("div");
          top.insertBefore(wrap, title);
          wrap.appendChild(title);
          wrap.appendChild(sub);
        } else {
          title.insertAdjacentElement("afterend", sub);
        }
      }
      setupScene(top, { dark: true, cx: 0.7, cy: 0.5, rh: 1.1, rw: 0.22, max: 150, n: 460, rings: false, alpha: 0.85, stars: false });
    }

    var cards = area.querySelectorAll(".row > [class*='col'] > .dashboard-card");
    var idx = 0, i, j;
    for (i = 0; i < cards.length; i++) {
      var card = cards[i];
      if (card.getAttribute("data-pm-kpi")) continue;
      if (card.querySelector("table, canvas, ul, ol, form, .table-responsive, .chat-list")) continue;
      if (!card.offsetHeight || card.offsetHeight > 230 || card.textContent.trim().length > 70) continue;
      card.setAttribute("data-pm-kpi", "1");
      card.classList.add("pm-kpi");

      var leaves = card.querySelectorAll("*"), numEl = null;
      for (j = 0; j < leaves.length; j++) {
        if (leaves[j].children.length === 0 && leaves[j].textContent.trim() &&
            parseFloat(getComputedStyle(leaves[j]).fontSize) >= 24) { numEl = leaves[j]; break; }
      }
      if (numEl) {
        numEl.classList.add("pm-kpi-num");
        (function (el, n) { setTimeout(function () { countUp(el); }, 120 + n * 90); })(numEl, idx);
      }
      idx++;

      var label = card.textContent.toLowerCase();
      if (!card.querySelector("i.bi, svg, .icon-badge, .feature-icon")) {
        var icon = "bi-stars";
        for (j = 0; j < KPI_ICONS.length; j++) if (KPI_ICONS[j][0].test(label)) { icon = KPI_ICONS[j][1]; break; }
        var pct = label.match(/(\d{1,3})\s*%/);
        var chip = doc.createElement("span");
        chip.setAttribute("aria-hidden", "true");
        if (/progress/.test(label) && pct) {
          chip.className = "pm-ring";
          chip.innerHTML = '<i class="bi ' + icon + '"></i>';
          card.appendChild(chip);
          (function (c, v) { setTimeout(function () { c.style.setProperty("--pm-p", Math.min(100, v)); }, 350); })(chip, parseInt(pct[1], 10));
        } else {
          chip.className = "pm-kpi-chip";
          chip.innerHTML = '<i class="bi ' + icon + '"></i>';
          card.appendChild(chip);
        }
      }
    }
    var rows = area.querySelectorAll(".row");
    for (i = 0; i < rows.length; i++) {
      var kids = rows[i].children;
      if (kids.length === 5) {
        var all = true;
        for (j = 0; j < kids.length; j++) if (!kids[j].querySelector(":scope > .pm-kpi")) all = false;
        if (all) rows[i].classList.add("pm-kpi-row-5");
      }
    }
  }

  /* ---------------- charts (Chart.js, Admin analytics) ---------------- */
  function gradFill(c1, c2) {
    return function (ctx) {
      var ch = ctx.chart, ar = ch.chartArea;
      if (!ar) return c2;
      var g = ch.ctx.createLinearGradient(0, ar.bottom, 0, ar.top);
      g.addColorStop(0, c1); g.addColorStop(1, c2);
      return g;
    };
  }
  var BAR_PALETTE = [["#4f46e5", "#b46cf5"], ["#0ea5e9", "#6366f1"], ["#f59e0b", "#f97316"], ["#10b981", "#22d3ee"]];
  function safe(fn) { try { fn(); } catch (e) { /* ignore a single unsupported option */ } }
  function enhanceCharts() {
    var C = window.Chart;
    if (!C) return;
    safe(function () {
      C.defaults.font.family = "'Poppins','Sora',system-ui,sans-serif";
      C.defaults.color = "#667085";
      var tt = C.defaults.plugins.tooltip;
      tt.backgroundColor = "rgba(20,17,46,0.94)"; tt.padding = 12; tt.cornerRadius = 12; tt.boxPadding = 6;
    });
    var list = [];
    try { list = C.instances ? Object.keys(C.instances).map(function (k) { return C.instances[k]; }) : []; } catch (e2) { list = []; }
    list.forEach(function (ch) {
      if (!ch || ch.__pmDone) return;
      ch.__pmDone = true;
      var type = ch.config.type, o = ch.options;
      safe(function () { o.animation = { duration: 1500, easing: "easeOutQuart" }; });
      if (type === "bar" || type === "line") {
        safe(function () { o.aspectRatio = 2; });
        safe(function () { o.scales.y.grid.color = "rgba(85,53,230,0.08)"; });
        safe(function () { o.scales.y.grid.borderDash = [4, 6]; });
        safe(function () { o.scales.x.grid.display = false; });
        safe(function () { o.scales.x.ticks.padding = 8; o.scales.y.ticks.padding = 8; });
        ch.data.datasets.forEach(function (ds, di) {
          var pal = BAR_PALETTE[di % BAR_PALETTE.length];
          if (type === "bar") {
            ds.backgroundColor = gradFill(pal[0], pal[1]);
            ds.borderRadius = 14; ds.borderSkipped = false; ds.maxBarThickness = 58; ds.borderWidth = 0;
          } else {
            ds.borderColor = pal[0]; ds.borderWidth = 3; ds.tension = 0.42; ds.pointRadius = 0; ds.pointHoverRadius = 6;
            ds.fill = true; ds.backgroundColor = gradFill("rgba(79,70,229,0.02)", "rgba(124,58,237,0.28)");
          }
        });
      } else if (type === "doughnut" || type === "pie") {
        safe(function () { o.aspectRatio = 1.4; });
        if (type === "doughnut") safe(function () { o.cutout = "68%"; });
        safe(function () { o.plugins.legend.position = "bottom"; });
        safe(function () { o.plugins.legend.labels.usePointStyle = true; o.plugins.legend.labels.pointStyle = "circle"; o.plugins.legend.labels.padding = 18; });
        ch.data.datasets.forEach(function (ds) {
          ds.borderWidth = 0; ds.borderRadius = 10; ds.spacing = 4; ds.hoverOffset = 12;
        });
      }
      safe(function () { ch.reset(); });
      safe(function () { ch.update(); });
    });
  }

  /* ---------------- sign-in: floating glass chips around the globe ---------------- */
  function chipEl(icon, big, small, cls) {
    var c = doc.createElement("div");
    c.className = "pm-chip pm-chip-" + cls;
    c.setAttribute("aria-hidden", "true");
    c.innerHTML = '<i class="bi ' + icon + '"></i><span><b>' + big + "</b><small>" + small + "</small></span>";
    return c;
  }
  function authExtras() {
    var sides = doc.querySelectorAll(".login-scene .auth-side");
    for (var i = 0; i < sides.length; i++) {
      var side = sides[i];
      if (side.getAttribute("data-pm-chips")) continue;
      side.setAttribute("data-pm-chips", "1");
      side.appendChild(chipEl("bi-people-fill", "8.9k+", "successful matches", "a"));
      side.appendChild(chipEl("bi-star-fill", "4.8 / 5", "average mentor rating", "b"));
      setupScene(side, { dark: true, cx: 0.5, cy: 0.31, rh: 0.225, rw: 0.3, max: 215, n: 980 });
    }
  }

  function enhanceAll() {
    markDarkCards();
    enhanceImages();
    enhanceDashboard();
    authExtras();
  }

  function scan() {
    var i, list;
    list = doc.querySelectorAll(REVEAL);
    for (i = 0; i < list.length; i++) setupReveal(list[i], i % 6);
    if (fine && !reduce) {
      list = doc.querySelectorAll(TILT);
      for (i = 0; i < list.length; i++) setupTilt(list[i]);
      list = doc.querySelectorAll(MAGNET);
      for (i = 0; i < list.length; i++) setupMagnet(list[i]);
    }
    list = doc.querySelectorAll(RIPPLE);
    for (i = 0; i < list.length; i++) setupRipple(list[i]);

    list = doc.querySelectorAll(".hero-section");
    for (i = 0; i < list.length; i++) setupScene(list[i], { alpha: 0.95, rh: 0.46, rw: 0.3, max: 320 });
    enhanceAll();
    list = doc.querySelectorAll(".mp-hero");
    for (i = 0; i < list.length; i++) setupScene(list[i], { dark: true, alpha: 0.75, cx: 0.86, cy: 0.5, rh: 0.9, rw: 0.2, max: 170 });
  }

  ready(function () {
    try {
      if ("IntersectionObserver" in window) {
        io = new IntersectionObserver(function (entries) {
          entries.forEach(function (en) {
            if (en.isIntersecting) {
              io.unobserve(en.target);
              revealNow(en.target, en.target.__pmDelay || 0);
            }
          });
        }, { threshold: 0.12, rootMargin: "0px 0px -6% 0px" });
        sceneIO = new IntersectionObserver(function (entries) {
          entries.forEach(function (en) {
            var sc = en.target.__pmScene;
            if (sc) { sc.visible = en.isIntersecting; if (en.isIntersecting) kick(); }
          });
        }, { threshold: 0 });
      }
      atmosphere();
      scan();
      window.addEventListener("load", function () { setTimeout(enhanceCharts, 150); setTimeout(enhanceCharts, 1200); });
      setTimeout(enhanceCharts, 500);

      var timer = null;
      if ("MutationObserver" in window) {
        new MutationObserver(function () {
          clearTimeout(timer);
          timer = setTimeout(scan, 140);
        }).observe(doc.body, { childList: true, subtree: true });
      }
      var rz = null;
      window.addEventListener("resize", function () {
        clearTimeout(rz);
        rz = setTimeout(function () { scenes.forEach(function (s) { s.resize(); }); }, 150);
      });
      doc.addEventListener("visibilitychange", function () { if (!doc.hidden) kick(); });
      window.addEventListener("beforeprint", function () {
        var n = doc.querySelectorAll(".pm-pre");
        for (var i = 0; i < n.length; i++) { n[i].classList.remove("pm-pre"); }
      });
      /* safety net: nothing may ever stay hidden */
      setTimeout(function () {
        var n = doc.querySelectorAll(".pm-pre:not(.pm-in)");
        for (var i = 0; i < n.length; i++) {
          var r = n[i].getBoundingClientRect();
          if (r.top < window.innerHeight && r.bottom > 0) revealNow(n[i], 0);
        }
      }, 3500);
    } catch (err) {
      if (window.console) console.warn("MentorHub premium layer skipped:", err);
      var hidden = doc.querySelectorAll(".pm-pre");
      for (var h = 0; h < hidden.length; h++) hidden[h].classList.remove("pm-pre");
    }
  });
})();
