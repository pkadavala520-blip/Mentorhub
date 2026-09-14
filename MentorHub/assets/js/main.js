function loadSharedLayout() {
  const currentPath = window.location.pathname.replace(/\\/g, '/');
  const pageDir = currentPath.substring(0, currentPath.lastIndexOf('/') + 1);
  const headerUrl = pageDir + 'header.html';
  const footerUrl = pageDir + 'footer.html';

  const loadPartial = function (id, url) {
    const container = document.getElementById(id);
    if (!container) return;

    fetch(url, { cache: 'no-store' })
      .then(function (response) {
        if (!response.ok) throw new Error('Partial not found');
        return response.text();
      })
      .then(function (html) {
        container.innerHTML = html;
      })
      .catch(function () {
        container.innerHTML = '';
      });
  };

  loadPartial('site-header', headerUrl);
  loadPartial('site-footer', footerUrl);
}

/* ===========================================================
   Page Transitions
   Fades the current page out (see .pt-page-exit in styles.css)
   before following an internal link, so navigation between
   pages feels like one continuous, polished experience instead
   of an abrupt reload. Entrance animation is handled purely in
   CSS (pt-page-enter), so it still runs even if this script is
   slow to load.
   =========================================================== */
function initPageTransitions() {
  var prefersReducedMotion = window.matchMedia(
    '(prefers-reduced-motion: reduce)'
  ).matches;

  // If the user prefers reduced motion, let every navigation
  // behave like a normal, instant browser navigation.
  if (prefersReducedMotion) return;

  var EXIT_DURATION = 260; // keep in sync with .pt-page-exit in styles.css
  var navigating = false;

  document.addEventListener('click', function (event) {
    if (event.defaultPrevented || event.button !== 0) return;
    if (event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;

    var link = event.target.closest('a[href]');
    if (!link) return;

    // Let Bootstrap tabs/collapses/dropdowns and in-page tab
    // switches behave exactly as before, untouched.
    if (
      link.hasAttribute('data-bs-toggle') ||
      link.hasAttribute('data-bs-target') ||
      link.classList.contains('js-tab-switch')
    ) {
      return;
    }

    if (link.target && link.target !== '_self') return;
    if (link.hasAttribute('download')) return;

    var href = link.getAttribute('href');
    if (
      !href ||
      href.charAt(0) === '#' ||
      href.indexOf('mailto:') === 0 ||
      href.indexOf('tel:') === 0 ||
      href.indexOf('javascript:') === 0
    ) {
      return;
    }

    var url;
    try {
      url = new URL(href, window.location.href);
    } catch (e) {
      return;
    }

    // Only intercept normal same-site page navigations.
    if (url.origin !== window.location.origin) return;
    if (url.pathname === window.location.pathname && url.hash) return;
    if (navigating) return;

    event.preventDefault();
    navigating = true;
    document.body.classList.add('pt-page-exit');

    window.setTimeout(function () {
      window.location.href = url.href;
    }, EXIT_DURATION);
  });

  // If the page is restored from the back/forward cache, make
  // sure it isn't stuck mid-exit-animation.
  window.addEventListener('pageshow', function () {
    navigating = false;
    document.body.classList.remove('pt-page-exit');
  });
}

document.addEventListener('DOMContentLoaded', function () {
  loadSharedLayout();
  initPageTransitions();

  const contactForm = document.getElementById('contactForm');
  const formMessage = document.getElementById('formMessage');

  if (contactForm && formMessage) {
    contactForm.addEventListener('submit', function (event) {
      event.preventDefault();
      formMessage.style.display = 'block';
      contactForm.reset();
    });
  }

  const loginForm = document.getElementById('loginForm');
  const loginMessage = document.getElementById('loginMessage');

  if (loginForm && loginMessage) {
    const dashboardByRole = {
      admin: '../Admin/index.html',
      mentor: '../Mentor/index.html',
      mentee: '../Mentee/index.html'
    };

    loginForm.addEventListener('submit', function (event) {
      event.preventDefault();

      // Never proceed if required fields (Email, Password) are empty or invalid.
      if (!loginForm.checkValidity()) {
        loginForm.reportValidity();
        return;
      }

      const clickedButton = event.submitter;
      const role = clickedButton && clickedButton.getAttribute('data-role');
      const destination = dashboardByRole[role] || dashboardByRole.admin;

      loginMessage.style.display = 'block';
      loginForm.reset();
      setTimeout(function () {
        window.location.href = destination;
      }, 900);
    });
  }

  const registerForm = document.getElementById('registerForm');
  const registerMessage = document.getElementById('registerMessage');

  if (registerForm && registerMessage) {
    registerForm.addEventListener('submit', function (event) {
      event.preventDefault();
      registerMessage.style.display = 'block';
      registerForm.reset();
    });
  }

  const signInTabBtn = document.getElementById('login-tab');
  const signUpTabBtn = document.getElementById('register-tab');
  const leftPanelSignIn = document.getElementById('leftpanel-signin');
  const leftPanelSignUp = document.getElementById('leftpanel-signup');

  if (signInTabBtn && signUpTabBtn && leftPanelSignIn && leftPanelSignUp) {
    signInTabBtn.addEventListener('shown.bs.tab', function () {
      leftPanelSignIn.style.display = '';
      leftPanelSignUp.style.display = 'none';
    });

    signUpTabBtn.addEventListener('shown.bs.tab', function () {
      leftPanelSignUp.style.display = '';
      leftPanelSignIn.style.display = 'none';
    });
  }

  document.querySelectorAll('.js-tab-switch').forEach(function (link) {
    link.addEventListener('click', function (event) {
      event.preventDefault();
      const targetBtn = document.getElementById(link.getAttribute('data-target-tab'));
      if (targetBtn && window.bootstrap && window.bootstrap.Tab) {
        window.bootstrap.Tab.getOrCreateInstance(targetBtn).show();
      }
    });
  });

  const filterPills = document.querySelectorAll('.filter-pill[data-filter]');
  const filterableCards = document.querySelectorAll('[data-category]');

  if (filterPills.length && filterableCards.length) {
    filterPills.forEach(function (pill) {
      pill.addEventListener('click', function () {
        filterPills.forEach(function (p) { p.classList.remove('active'); });
        pill.classList.add('active');

        const filter = pill.getAttribute('data-filter');

        filterableCards.forEach(function (card) {
          const matches = filter === 'all' || card.getAttribute('data-category') === filter;
          card.style.display = matches ? '' : 'none';
        });
      });

      pill.addEventListener('keydown', function (event) {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          pill.click();
        }
      });
    });
  }

  const sidebarToggle = document.querySelector('[data-sidebar-toggle]');
  const sidebar = document.querySelector('.sidebar');

  if (sidebarToggle && sidebar) {
    const backdrop = document.createElement('div');
    backdrop.className = 'sidebar-backdrop';
    document.body.appendChild(backdrop);

    const closeSidebar = () => sidebar.classList.remove('active');

    const toggleIcon = sidebarToggle.querySelector('i');

    const syncToggleState = () => {
      const isOpen = sidebar.classList.contains('active');
      sidebarToggle.setAttribute('aria-expanded', isOpen);
      if (toggleIcon) {
        toggleIcon.classList.toggle('bi-list', !isOpen);
        toggleIcon.classList.toggle('bi-x-lg', isOpen);
      }
    };

    sidebarToggle.addEventListener('click', function (event) {
      event.stopPropagation();
      // Guard: the toggle/backdrop are only meaningful once the sidebar
      // goes off-canvas (max-width: 991px). This stops any stray click
      // from dimming the whole screen on desktop.
      if (window.innerWidth > 991) return;
      sidebar.classList.toggle('active');
      backdrop.classList.toggle('show', sidebar.classList.contains('active'));
      syncToggleState();
    });

    backdrop.addEventListener('click', function () {
      closeSidebar();
      backdrop.classList.remove('show');
      syncToggleState();
    });

    document.addEventListener('keydown', function (event) {
      if (event.key === 'Escape') {
        closeSidebar();
        backdrop.classList.remove('show');
        syncToggleState();
      }
    });

    window.addEventListener('resize', function () {
      if (window.innerWidth > 991) {
        closeSidebar();
        backdrop.classList.remove('show');
        syncToggleState();
      }
    });
  }

  /* ===========================================================
     Profile photo system
     - Placeholder ("no photo yet") state until the person uploads one.
     - "+" button / double-click on an existing photo opens a shared,
       dynamically-built Bootstrap modal that walks through:
         Add photo   -> Use Camera | Upload photo
         Profile photo viewer -> Edit | Update | Frames | Delete
         Edit        -> zoom / rotate, saved via canvas
         Frames      -> a few preset colour rings
     Reusable for any role: each wrapper carries data-photo-key="..."
     (e.g. "mentorProfilePhoto") so roles never overwrite each other's
     photo. Any <img class="profile-photo"> sharing that key (a big
     avatar + a small topbar avatar) stays in sync automatically.
  =========================== */
  (function initProfilePhotoSystem() {
    const DEFAULT_PHOTO_KEY = 'mentorProfilePhoto';
    const FRAME_IDS = ['none', 'blue', 'gold', 'green', 'pink'];
    const PLACEHOLDER_SVG = 'data:image/svg+xml;utf8,' + encodeURIComponent(
      '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">' +
      '<rect width="200" height="200" fill="#eef0f3"/>' +
      '<circle cx="100" cy="78" r="38" fill="#a9b4c2"/>' +
      '<path d="M28 192 C28 128 172 128 172 192 Z" fill="#a9b4c2"/>' +
      '</svg>'
    );

    const wraps = document.querySelectorAll('.profile-photo-wrap[data-photo-key]');
    const allProfileImgs = document.querySelectorAll('.profile-photo');
    if (!wraps.length || typeof bootstrap === 'undefined') return;

    const keyOf = function (el) {
      const wrap = el.closest('[data-photo-key]');
      return (wrap && wrap.dataset.photoKey) || DEFAULT_PHOTO_KEY;
    };
    const frameKeyOf = function (key) { return key + ':frame'; };

    const getPhoto = function (key) { return localStorage.getItem(key); };
    const setPhoto = function (key, dataUrl) {
      try { localStorage.setItem(key, dataUrl); } catch (e) { /* storage full/unavailable */ }
    };
    const clearPhoto = function (key) {
      try { localStorage.removeItem(key); } catch (e) { /* ignore */ }
    };
    const getFrame = function (key) { return localStorage.getItem(frameKeyOf(key)) || 'none'; };
    const setFrame = function (key, frame) {
      try { localStorage.setItem(frameKeyOf(key), frame); } catch (e) { /* ignore */ }
    };

    const applyFrameClass = function (wrapEl, frame) {
      FRAME_IDS.forEach(function (id) { wrapEl.classList.remove('frame-' + id); });
      wrapEl.classList.add('frame-' + (frame || 'none'));
    };

    const refreshImagesForKey = function (key) {
      const saved = getPhoto(key);
      allProfileImgs.forEach(function (img) {
        if (keyOf(img) !== key) return;
        if (saved) {
          img.src = saved;
          img.classList.remove('profile-photo-empty');
        } else {
          img.src = PLACEHOLDER_SVG;
          img.classList.add('profile-photo-empty');
        }
      });
      wraps.forEach(function (wrap) {
        if (wrap.dataset.photoKey !== key) return;
        applyFrameClass(wrap, getFrame(key));
        // Once a real photo is uploaded, the "+" button gives way to the
        // double-click viewer (Edit / Update / Frames / Delete) instead of
        // sitting on top of the photo.
        const editBtn = wrap.querySelector('.photo-edit-btn');
        if (editBtn) editBtn.classList.toggle('d-none', !!saved);
      });
    };

    // Initial paint for every key present on this page.
    const keysOnPage = new Set();
    allProfileImgs.forEach(function (img) { keysOnPage.add(keyOf(img)); });
    keysOnPage.forEach(refreshImagesForKey);

    /* ---------- shared modal shell ---------- */
    let modalEl = document.getElementById('photoModal');
    if (!modalEl) {
      modalEl = document.createElement('div');
      modalEl.id = 'photoModal';
      modalEl.className = 'modal fade';
      modalEl.tabIndex = -1;
      modalEl.setAttribute('aria-hidden', 'true');
      modalEl.innerHTML = '<div class="modal-dialog modal-dialog-centered"><div class="modal-content" id="photoModalContent"></div></div>';
      document.body.appendChild(modalEl);
    }
    const contentEl = modalEl.querySelector('#photoModalContent');
    const bsModal = new bootstrap.Modal(modalEl);
    let activeKey = null;
    let cameraStream = null;

    const stopCamera = function () {
      if (cameraStream) {
        cameraStream.getTracks().forEach(function (t) { t.stop(); });
        cameraStream = null;
      }
    };
    modalEl.addEventListener('hidden.bs.modal', stopCamera);

    const fileToDataUrl = function (file, cb) {
      if (!file.type.startsWith('image/')) { alert('Please choose an image file.'); return; }
      if (file.size > 4 * 1024 * 1024) { alert('Please choose an image smaller than 4MB.'); return; }
      const reader = new FileReader();
      reader.onload = function (e) { cb(e.target.result); };
      reader.readAsDataURL(file);
    };

    /* ---- screen: Add photo (Use Camera / Upload photo) ---- */
    function showAddScreen(key) {
      activeKey = key;
      stopCamera();
      contentEl.innerHTML =
        '<div class="modal-header"><h5 class="modal-title">Add photo</h5>' +
        '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>' +
        '<div class="modal-body text-center">' +
        '<p class="mb-3 fw-semibold">No professional headshot needed! Just something that represents you.</p>' +
        '<div id="photoCameraArea" class="d-none mb-3">' +
        '<video id="photoCameraVideo" autoplay playsinline muted class="rounded-circle" style="width:220px;height:220px;object-fit:cover;"></video>' +
        '<canvas id="photoCameraCanvas" class="d-none"></canvas>' +
        '</div>' +
        '<input type="file" id="photoFileInput" accept="image/*" class="d-none" />' +
        '</div>' +
        '<div class="modal-footer justify-content-center" id="photoAddFooter">' +
        '<button type="button" class="btn btn-outline-primary" id="photoUseCameraBtn"><i class="bi bi-camera me-1"></i>Use Camera</button>' +
        '<button type="button" class="btn gradient-btn" id="photoUploadBtn"><i class="bi bi-upload me-1"></i>Upload photo</button>' +
        '</div>';

      const fileInput = contentEl.querySelector('#photoFileInput');
      contentEl.querySelector('#photoUploadBtn').addEventListener('click', function () { fileInput.click(); });
      fileInput.addEventListener('change', function () {
        const file = fileInput.files && fileInput.files[0];
        if (!file) return;
        fileToDataUrl(file, function (dataUrl) {
          setPhoto(activeKey, dataUrl);
          refreshImagesForKey(activeKey);
          bsModal.hide();
        });
      });
      contentEl.querySelector('#photoUseCameraBtn').addEventListener('click', startCamera);

      bsModal.show();
    }

    function startCamera() {
      if (!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia)) {
        alert('Camera access needs HTTPS (or localhost) and browser permission, and is not available here.');
        return;
      }
      const area = contentEl.querySelector('#photoCameraArea');
      const video = contentEl.querySelector('#photoCameraVideo');
      const footer = contentEl.querySelector('#photoAddFooter');
      area.classList.remove('d-none');
      footer.innerHTML =
        '<button type="button" class="btn btn-outline-secondary" id="photoCancelCameraBtn">Cancel</button>' +
        '<button type="button" class="btn gradient-btn" id="photoCaptureBtn"><i class="bi bi-camera-fill me-1"></i>Capture</button>';

      navigator.mediaDevices.getUserMedia({ video: { facingMode: 'user' } }).then(function (stream) {
        cameraStream = stream;
        video.srcObject = stream;
      }).catch(function () {
        alert('Could not access the camera. Please check permissions and try again.');
        showAddScreen(activeKey);
      });

      contentEl.querySelector('#photoCancelCameraBtn').addEventListener('click', function () {
        stopCamera();
        showAddScreen(activeKey);
      });
      contentEl.querySelector('#photoCaptureBtn').addEventListener('click', function () {
        const canvas = contentEl.querySelector('#photoCameraCanvas');
        const size = Math.min(video.videoWidth, video.videoHeight) || 300;
        canvas.width = size;
        canvas.height = size;
        const ctx = canvas.getContext('2d');
        const sx = (video.videoWidth - size) / 2;
        const sy = (video.videoHeight - size) / 2;
        ctx.drawImage(video, sx, sy, size, size, 0, 0, size, size);
        const dataUrl = canvas.toDataURL('image/png');
        stopCamera();
        setPhoto(activeKey, dataUrl);
        refreshImagesForKey(activeKey);
        bsModal.hide();
      });
    }

    /* ---- screen: Profile photo viewer (Edit / Update / Frames / Delete) ---- */
    function showViewScreen(key) {
      activeKey = key;
      const photo = getPhoto(key) || PLACEHOLDER_SVG;
      contentEl.innerHTML =
        '<div class="modal-header"><h5 class="modal-title">Profile photo</h5>' +
        '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>' +
        '<div class="modal-body text-center">' +
        '<div class="profile-photo-wrap frame-' + getFrame(key) + ' d-inline-block mb-2">' +
        '<img src="' + photo + '" class="rounded-circle profile-photo" style="width:220px;height:220px;object-fit:cover;" alt="Profile" />' +
        '</div>' +
        '</div>' +
        '<div class="modal-footer justify-content-between flex-nowrap">' +
        '<div class="d-flex">' +
        '<button type="button" class="photo-action-btn" id="photoEditBtn"><i class="bi bi-pencil"></i><span>Edit</span></button>' +
        '<button type="button" class="photo-action-btn" id="photoUpdateBtn"><i class="bi bi-camera"></i><span>Update</span></button>' +
        '<button type="button" class="photo-action-btn" id="photoFramesBtn"><i class="bi bi-border-outer"></i><span>Frames</span></button>' +
        '</div>' +
        '<button type="button" class="photo-action-btn text-danger" id="photoDeleteBtn"><i class="bi bi-trash"></i><span>Delete</span></button>' +
        '</div>';

      contentEl.querySelector('#photoUpdateBtn').addEventListener('click', function () { showAddScreen(key); });
      contentEl.querySelector('#photoEditBtn').addEventListener('click', function () { showEditScreen(key); });
      contentEl.querySelector('#photoFramesBtn').addEventListener('click', function () { showFramesScreen(key); });
      contentEl.querySelector('#photoDeleteBtn').addEventListener('click', function () {
        if (confirm('Remove your profile photo?')) {
          clearPhoto(key);
          setFrame(key, 'none');
          refreshImagesForKey(key);
          bsModal.hide();
        }
      });

      bsModal.show();
    }

    /* ---- screen: Edit (zoom + rotate, rendered to canvas on save) ---- */
    function showEditScreen(key) {
      const photo = getPhoto(key) || PLACEHOLDER_SVG;
      let zoom = 1;
      let rotate = 0;
      contentEl.innerHTML =
        '<div class="modal-header"><h5 class="modal-title">Edit photo</h5>' +
        '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>' +
        '<div class="modal-body text-center">' +
        '<div class="photo-edit-frame mb-3"><img id="photoEditImg" src="' + photo + '" alt="Edit preview" /></div>' +
        '<label class="form-label small text-muted d-block mb-1">Zoom</label>' +
        '<input type="range" id="photoZoomRange" min="1" max="2.5" step="0.05" value="1" class="form-range mb-2" />' +
        '<button type="button" class="btn btn-sm btn-outline-secondary me-2" id="photoRotateLeftBtn"><i class="bi bi-arrow-counterclockwise"></i></button>' +
        '<button type="button" class="btn btn-sm btn-outline-secondary" id="photoRotateRightBtn"><i class="bi bi-arrow-clockwise"></i></button>' +
        '</div>' +
        '<div class="modal-footer">' +
        '<button type="button" class="btn btn-outline-secondary" id="photoEditCancelBtn">Cancel</button>' +
        '<button type="button" class="btn gradient-btn" id="photoEditSaveBtn">Save</button>' +
        '</div>';

      const img = contentEl.querySelector('#photoEditImg');
      const applyTransform = function () {
        img.style.transform = 'translate(-50%, -50%) scale(' + zoom + ') rotate(' + rotate + 'deg)';
      };
      applyTransform();

      contentEl.querySelector('#photoZoomRange').addEventListener('input', function (e) {
        zoom = parseFloat(e.target.value);
        applyTransform();
      });
      contentEl.querySelector('#photoRotateLeftBtn').addEventListener('click', function () { rotate -= 90; applyTransform(); });
      contentEl.querySelector('#photoRotateRightBtn').addEventListener('click', function () { rotate += 90; applyTransform(); });
      contentEl.querySelector('#photoEditCancelBtn').addEventListener('click', function () { showViewScreen(key); });

      contentEl.querySelector('#photoEditSaveBtn').addEventListener('click', function () {
        const size = 320;
        const canvas = document.createElement('canvas');
        canvas.width = size;
        canvas.height = size;
        const ctx = canvas.getContext('2d');
        const im = new Image();
        im.onload = function () {
          ctx.save();
          ctx.translate(size / 2, size / 2);
          ctx.rotate(rotate * Math.PI / 180);
          ctx.scale(zoom, zoom);
          const ratio = Math.max(size / im.width, size / im.height);
          const w = im.width * ratio;
          const h = im.height * ratio;
          ctx.drawImage(im, -w / 2, -h / 2, w, h);
          ctx.restore();
          setPhoto(key, canvas.toDataURL('image/png'));
          refreshImagesForKey(key);
          showViewScreen(key);
        };
        im.src = photo;
      });

      bsModal.show();
    }

    /* ---- screen: Frames (preset colour rings) ---- */
    function showFramesScreen(key) {
      const current = getFrame(key);
      const photo = getPhoto(key) || PLACEHOLDER_SVG;
      const options = [
        { id: 'none', label: 'None' },
        { id: 'blue', label: 'Blue' },
        { id: 'gold', label: 'Gold' },
        { id: 'green', label: 'Green' },
        { id: 'pink', label: 'Pink' }
      ];
      contentEl.innerHTML =
        '<div class="modal-header"><h5 class="modal-title">Frames</h5>' +
        '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>' +
        '<div class="modal-body text-center">' +
        '<div class="d-flex justify-content-center gap-3 flex-wrap">' +
        options.map(function (o) {
          return '<button type="button" class="btn frame-swatch-btn" data-frame="' + o.id + '">' +
            '<div class="profile-photo-wrap frame-' + o.id + ' d-inline-block mb-1">' +
            '<img src="' + photo + '" class="rounded-circle profile-photo" style="width:70px;height:70px;object-fit:cover;" alt="' + o.label + ' frame" />' +
            '</div>' +
            '<div class="small ' + (o.id === current ? 'fw-bold text-primary' : 'text-muted') + '">' + o.label + '</div>' +
            '</button>';
        }).join('') +
        '</div>' +
        '</div>' +
        '<div class="modal-footer">' +
        '<button type="button" class="btn btn-outline-secondary" id="photoFramesCancelBtn">Back</button>' +
        '</div>';

      contentEl.querySelectorAll('.frame-swatch-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
          setFrame(key, btn.dataset.frame);
          refreshImagesForKey(key);
          showViewScreen(key);
        });
      });
      contentEl.querySelector('#photoFramesCancelBtn').addEventListener('click', function () { showViewScreen(key); });

      bsModal.show();
    }

    /* ---------- wire up every photo widget on this page ---------- */
    wraps.forEach(function (wrap) {
      const key = wrap.dataset.photoKey;
      const btn = wrap.querySelector('.photo-edit-btn');
      const img = wrap.querySelector('.profile-photo');

      if (btn) {
        btn.addEventListener('click', function () { showAddScreen(key); });
      }
      if (img) {
        img.style.cursor = 'pointer';
        img.title = 'Double-click to view photo';
        img.addEventListener('dblclick', function () {
          if (getPhoto(key)) { showViewScreen(key); } else { showAddScreen(key); }
        });
      }
    });

    console.log('[MentorHub] Profile photo system ready for: ' + Array.from(keysOnPage).join(', '));
  })();

  const yearEl = document.getElementById('year');
  if (yearEl) yearEl.textContent = new Date().getFullYear();

  const faders = document.querySelectorAll('.fade-in');
  faders.forEach(function (el, index) {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
  });

  if ('IntersectionObserver' in window && faders.length) {
    const observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.style.transition = 'all 0.6s ease';
          entry.target.style.opacity = '1';
          entry.target.style.transform = 'translateY(0)';
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.15 });

    faders.forEach(function (el) {
      observer.observe(el);
    });
  } else {
    faders.forEach(function (el, index) {
      setTimeout(function () {
        el.style.transition = 'all 0.6s ease';
        el.style.opacity = '1';
        el.style.transform = 'translateY(0)';
      }, 120 * index + 120);
    });
  }
});

// // 3D card mouse movement

// const card = document.querySelector(".auth-card-3d");


// if(card){

// document.addEventListener("mousemove",function(e){


// let x = (window.innerWidth / 2 - e.clientX) / 40;

// let y = (window.innerHeight / 2 - e.clientY) / 40;


// card.style.transform =
// `
// perspective(1000px)
// rotateY(${x}deg)
// rotateX(${y}deg)
// `;

// });


// card.addEventListener("mouseleave",function(){

// card.style.transform =
// `
// perspective(1000px)
// rotateX(2deg)
// rotateY(-2deg)
// `;

// });


// }

// const loginCard =
// document.querySelector(".auth-card-3d");


// if(loginCard){


// document.addEventListener(
// "mousemove",
// (e)=>{


// let x =
// (window.innerWidth/2 - e.clientX)/50;


// let y =
// (window.innerHeight/2 - e.clientY)/50;



// loginCard.style.transform =

// `
// perspective(1000px)
// rotateX(${y}deg)
// rotateY(${x}deg)
// `;



// });


// }

/* ===========================
   Premium 3D Login Card Effect
=========================== */

const loginCard = document.querySelector(".auth-card-3d");

if (loginCard) {

    let rotateX = 0;
    let rotateY = 0;

    document.addEventListener("mousemove", (e) => {

        const rect = loginCard.getBoundingClientRect();

        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        const centerX = rect.width / 2;
        const centerY = rect.height / 2;

        rotateY = ((x - centerX) / centerX) * 8;
        rotateX = ((centerY - y) / centerY) * 8;

        loginCard.style.transition = "transform .15s linear";

        loginCard.style.transform = `
            perspective(1200px)
            rotateX(${rotateX}deg)
            rotateY(${rotateY}deg)
            translateY(-6px)
            scale(1.02)
        `;
    });

    loginCard.addEventListener("mouseleave", () => {

        loginCard.style.transition =
            "transform .6s cubic-bezier(.17,.84,.44,1)";

        loginCard.style.transform = `
            perspective(1200px)
            rotateX(0deg)
            rotateY(0deg)
            translateY(0)
            scale(1)
        `;
    });

    loginCard.addEventListener("mouseenter", () => {
        loginCard.style.transition = "transform .2s ease";
    });

}/* MentorHub - main.js
   Shared shell behaviour: seed data store, sidebar toggle, dark mode,
   notification dropdown, mini profile, badge counts, toasts.
   Loaded on every page BEFORE mentor-app.js.
*/
(function () {
  "use strict";

  var STORE_KEY = "mh_state_v1";

  /* ---------------------------------------------------------------- */
  /* Seed data - only used the first time the app runs in a browser    */
  /* ---------------------------------------------------------------- */
  function seedState() {
    return {
      profile: {
        name: "Daniel Ross",
        title: "Lead Software Engineer | 10+ Years Experience",
        bio: "I help students and professionals improve their software engineering skills through hands-on mentorship, interview prep, and career strategy.",
        education: "M.Tech in Computer Science",
        experience: "10+ years at Microsoft & Google",
        skillsSummary: "Java, Python, System Design",
        availability: "Mon-Fri, 7pm-10pm",
        rating: 4.9,
        reviews: 128,
        initials: "DR"
      },
      skills: [
        { id: "s1", name: "System Design", level: 90, category: "Engineering", icon: "bi-diagram-3" },
        { id: "s2", name: "Java & Spring Boot", level: 85, category: "Engineering", icon: "bi-cup-hot" },
        { id: "s3", name: "Python", level: 80, category: "Engineering", icon: "bi-filetype-py" },
        { id: "s4", name: "Interview Preparation", level: 95, category: "Career", icon: "bi-clipboard-check" },
        { id: "s5", name: "Career Strategy", level: 88, category: "Career", icon: "bi-signpost-split" },
        { id: "s6", name: "Leadership & Management", level: 75, category: "Soft Skills", icon: "bi-people" }
      ],
      availability: {
        Monday: [{ start: "19:00", end: "21:00" }],
        Tuesday: [],
        Wednesday: [{ start: "18:00", end: "20:00" }],
        Thursday: [],
        Friday: [{ start: "19:00", end: "21:00" }],
        Saturday: [{ start: "10:00", end: "12:00" }],
        Sunday: []
      },
      requests: [
        { id: "r1", name: "Priya Nair", initials: "PN", focus: "Frontend Development", message: "Looking for guidance on moving from junior to mid-level React roles.", status: "pending", date: "2026-09-10" },
        { id: "r2", name: "Arjun Mehta", initials: "AM", focus: "System Design", message: "Preparing for staff engineer interviews, would love mock sessions.", status: "pending", date: "2026-09-11" },
        { id: "r3", name: "Naina Shah", initials: "NS", focus: "Product Management", message: "Career transition into product management, need a structured plan.", status: "accepted", date: "2026-08-20" },
        { id: "r4", name: "Rohit Verma", initials: "RV", focus: "Backend Development", message: "Want help designing scalable backend systems.", status: "accepted", date: "2026-08-15" },
        { id: "r5", name: "Sana Iyer", initials: "SI", focus: "Career Strategy", message: "Not the right stage for me yet, will revisit later.", status: "rejected", date: "2026-08-02" }
      ],
      mentees: [
        { id: "m1", name: "Naina Shah", initials: "NS", focus: "Product Management", goal: "Career transition into product management", lastSession: "2 days ago", sessions: 8, progress: 72 },
        { id: "m2", name: "Rohit Verma", initials: "RV", focus: "Backend Development", goal: "Scalable systems & distributed architecture", lastSession: "5 days ago", sessions: 12, progress: 64 },
        { id: "m3", name: "Karan Thakur", initials: "KT", focus: "Interview Prep", goal: "Crack FAANG interviews within 6 months", lastSession: "1 week ago", sessions: 5, progress: 40 }
      ],
      conversations: [
        {
          id: "c1", name: "Naina Shah", initials: "NS", online: true, unread: 1,
          messages: [
            { from: "them", text: "Hi Daniel! Thanks again for the session yesterday.", time: "9:12 AM" },
            { from: "me", text: "Anytime! How did the PM case study go?", time: "9:20 AM" },
            { from: "them", text: "Went well, I used the framework we discussed.", time: "9:24 AM" }
          ]
        },
        {
          id: "c2", name: "Rohit Verma", initials: "RV", online: false, unread: 0,
          messages: [
            { from: "them", text: "Could we push our Thursday session to Friday?", time: "Yesterday" },
            { from: "me", text: "Sure, Friday 7pm works on my end.", time: "Yesterday" }
          ]
        },
        {
          id: "c3", name: "Karan Thakur", initials: "KT", online: true, unread: 0,
          messages: [
            { from: "them", text: "Just finished the mock interview, feeling much better!", time: "Mon" }
          ]
        }
      ],
      notifications: [
        { id: "n1", icon: "bi-ui-checks", title: "New matching request", text: "Priya Nair sent you a mentoring request.", time: "2h ago", read: false },
        { id: "n2", icon: "bi-chat-dots", title: "New message", text: "Naina Shah sent you a message.", time: "3h ago", read: false },
        { id: "n3", icon: "bi-calendar2-check", title: "Session reminder", text: "Session with Rohit Verma starts in 24 hours.", time: "1d ago", read: true },
        { id: "n4", icon: "bi-star", title: "New review", text: "Karan Thakur left you a 5 star review.", time: "3d ago", read: true }
      ],
      reviews: [
        { id: "rv1", name: "Naina Shah", initials: "NS", rating: 5, text: "Daniel's guidance completely changed how I approach product interviews. Structured, patient, and always practical.", date: "Sep 2026" },
        { id: "rv2", name: "Rohit Verma", initials: "RV", rating: 5, text: "Deep technical knowledge and great at explaining trade-offs in system design.", date: "Aug 2026" },
        { id: "rv3", name: "Karan Thakur", initials: "KT", rating: 4, text: "Very helpful mock interviews, would love even more of them.", date: "Aug 2026" }
      ],
      ratingBreakdown: { 5: 82, 4: 12, 3: 4, 2: 1, 1: 1 },
      sessions: [
        { date: "2026-09-17", time: "7:00 PM", title: "System Design Mock", mentee: "Rohit Verma" },
        { date: "2026-09-19", time: "6:00 PM", title: "Career Strategy Session", mentee: "Naina Shah" },
        { date: "2026-09-24", time: "7:30 PM", title: "Interview Prep", mentee: "Karan Thakur" },
        { date: "2026-09-26", time: "10:00 AM", title: "1:1 Check-in", mentee: "Naina Shah" },
        { date: "2026-09-29", time: "7:00 PM", title: "System Design Mock", mentee: "Rohit Verma" }
      ],
      settings: {
        displayName: "Daniel Ross",
        email: "daniel.ross@example.com",
        emailNotif: true,
        smsNotif: false,
        darkMode: false
      },
      activity: [
        { icon: "bi-ui-checks", text: "Accepted mentoring request from Rohit Verma", time: "2 days ago" },
        { icon: "bi-calendar2-check", text: "Completed session with Naina Shah", time: "3 days ago" },
        { icon: "bi-star-fill", text: "Received a 5-star review from Karan Thakur", time: "5 days ago" },
        { icon: "bi-plus-circle", text: "Added a new availability slot on Wednesday", time: "1 week ago" }
      ]
    };
  }

  function loadState() {
    try {
      var raw = localStorage.getItem(STORE_KEY);
      if (raw) return JSON.parse(raw);
    } catch (e) { /* fall through to reseed */ }
    var fresh = seedState();
    saveState(fresh);
    return fresh;
  }

  function saveState(state) {
    try {
      localStorage.setItem(STORE_KEY, JSON.stringify(state));
    } catch (e) { /* storage unavailable - ignore */ }
  }

  var state = loadState();

  /* ---------------------------------------------------------------- */
  /* Toasts                                                            */
  /* ---------------------------------------------------------------- */
  function ensureToastHost() {
    var host = document.querySelector(".mp-toast-host");
    if (!host) {
      host = document.createElement("div");
      host.className = "mp-toast-host";
      document.body.appendChild(host);
    }
    return host;
  }

  function toast(message, type) {
    var host = ensureToastHost();
    var el = document.createElement("div");
    el.className = "mp-toast " + (type ? "mp-toast-" + type : "");
    var icon = type === "success" ? "bi-check-circle-fill" : type === "danger" ? "bi-x-circle-fill" : "bi-info-circle-fill";
    el.innerHTML = '<i class="bi ' + icon + '"></i><span>' + message + "</span>";
    host.appendChild(el);
    requestAnimationFrame(function () { el.classList.add("show"); });
    setTimeout(function () {
      el.classList.remove("show");
      setTimeout(function () { el.remove(); }, 250);
    }, 2600);
  }

  /* ---------------------------------------------------------------- */
  /* Sidebar toggle (mobile / collapsed)                               */
  /* ---------------------------------------------------------------- */
  function initSidebarToggle() {
    var btns = document.querySelectorAll("[data-sidebar-toggle]");
    var sidebar = document.querySelector(".mp-sidebar");
    if (!sidebar) return;
    btns.forEach(function (btn) {
      btn.addEventListener("click", function () {
        sidebar.classList.toggle("mp-sidebar-open");
        var expanded = sidebar.classList.contains("mp-sidebar-open");
        btn.setAttribute("aria-expanded", expanded ? "true" : "false");
      });
    });
    document.addEventListener("click", function (e) {
      if (window.innerWidth > 991) return;
      if (!sidebar.classList.contains("mp-sidebar-open")) return;
      if (sidebar.contains(e.target)) return;
      if ([].some.call(btns, function (b) { return b.contains(e.target); })) return;
      sidebar.classList.remove("mp-sidebar-open");
    });
  }

  /* ---------------------------------------------------------------- */
  /* Dark mode                                                         */
  /* ---------------------------------------------------------------- */
  function applyDarkMode(on) {
    document.documentElement.classList.toggle("mp-dark", !!on);
    document.querySelectorAll("[data-dark-toggle]").forEach(function (input) {
      input.checked = !!on;
    });
  }

  function initDarkMode() {
    applyDarkMode(state.settings.darkMode);
    document.querySelectorAll("[data-dark-toggle]").forEach(function (input) {
      input.addEventListener("change", function () {
        state.settings.darkMode = input.checked;
        saveState(state);
        applyDarkMode(input.checked);
      });
    });
  }

  /* ---------------------------------------------------------------- */
  /* Mini profile (sidebar + avatar dropdown)                          */
  /* ---------------------------------------------------------------- */
  function initMiniProfile() {
    document.querySelectorAll("[data-mini-name]").forEach(function (el) {
      el.textContent = state.profile.name;
    });
    document.querySelectorAll("[data-mini-avatar]").forEach(function (el) {
      el.textContent = state.profile.initials;
    });
    document.querySelectorAll("[data-profile-name]").forEach(function (el) {
      el.textContent = state.profile.name.split(" ")[0] === el.textContent ? state.profile.name.split(" ")[0] : el.textContent;
    });
  }

  /* ---------------------------------------------------------------- */
  /* Badges + notification dropdown (present on every page)            */
  /* ---------------------------------------------------------------- */
  function pendingRequestCount() {
    return state.requests.filter(function (r) { return r.status === "pending"; }).length;
  }
  function unreadMessageCount() {
    return state.conversations.reduce(function (sum, c) { return sum + (c.unread || 0); }, 0);
  }
  function unreadNotifCount() {
    return state.notifications.filter(function (n) { return !n.read; }).length;
  }

  function refreshBadges() {
    var reqCount = pendingRequestCount();
    var msgCount = unreadMessageCount();
    document.querySelectorAll('[data-badge="requests"]').forEach(function (el) {
      el.textContent = reqCount;
      el.style.display = reqCount > 0 ? "" : "none";
    });
    document.querySelectorAll('[data-badge="messages"]').forEach(function (el) {
      el.textContent = msgCount;
      el.style.display = msgCount > 0 ? "" : "none";
    });
    document.querySelectorAll("[data-notif-dot]").forEach(function (el) {
      el.style.display = unreadNotifCount() > 0 ? "" : "none";
    });
  }

  function renderNotifDropdown() {
    var lists = document.querySelectorAll("[data-notif-list]");
    if (!lists.length) return;
    var items = state.notifications.slice(0, 5);
    var html = items.length ? items.map(function (n) {
      return '' +
        '<div class="mp-notif-item ' + (n.read ? "" : "unread") + '">' +
        '  <div class="mp-notif-icon"><i class="bi ' + n.icon + '"></i></div>' +
        '  <div class="mp-notif-body">' +
        '    <div class="mp-notif-title">' + n.title + "</div>" +
        '    <div class="mp-notif-text">' + n.text + "</div>" +
        '    <div class="mp-notif-time">' + n.time + "</div>" +
        "  </div>" +
        "</div>";
    }).join("") : '<div class="text-muted small px-2 py-3">No notifications yet.</div>';
    lists.forEach(function (el) { el.innerHTML = html; });
  }

  /* ---------------------------------------------------------------- */
  /* Fade / stagger entrance animation                                 */
  /* ---------------------------------------------------------------- */
  function initEntranceAnimation() {
    document.querySelectorAll(".fade-in").forEach(function (el, i) {
      el.style.animationDelay = (i * 40) + "ms";
    });
  }

  /* ---------------------------------------------------------------- */
  /* Count-up stat animation                                           */
  /* ---------------------------------------------------------------- */
  function initCountUp() {
    document.querySelectorAll("[data-countup]").forEach(function (el) {
      var target = parseFloat(el.getAttribute("data-countup"));
      var decimals = parseInt(el.getAttribute("data-decimals") || "0", 10);
      if (isNaN(target)) return;
      var start = 0;
      var duration = 900;
      var startTime = null;
      function step(ts) {
        if (!startTime) startTime = ts;
        var progress = Math.min((ts - startTime) / duration, 1);
        var eased = 1 - Math.pow(1 - progress, 3);
        var value = start + (target - start) * eased;
        el.textContent = decimals ? value.toFixed(decimals) : Math.round(value);
        if (progress < 1) requestAnimationFrame(step);
        else el.textContent = decimals ? target.toFixed(decimals) : target;
      }
      requestAnimationFrame(step);
    });
  }

  /* ---------------------------------------------------------------- */
  /* Public API used by mentor-app.js                                  */
  /* ---------------------------------------------------------------- */
  window.MentorApp = window.MentorApp || {};
  window.MentorApp.state = state;
  window.MentorApp.saveState = function () { saveState(state); refreshBadges(); renderNotifDropdown(); };
  window.MentorApp.toast = toast;
  window.MentorApp.refreshBadges = refreshBadges;
  window.MentorApp.helpers = {
    pendingRequestCount: pendingRequestCount,
    unreadMessageCount: unreadMessageCount,
    unreadNotifCount: unreadNotifCount
  };

  document.addEventListener("DOMContentLoaded", function () {
    initSidebarToggle();
    initDarkMode();
    initMiniProfile();
    refreshBadges();
    renderNotifDropdown();
    initEntranceAnimation();
    initCountUp();
  });
})();
