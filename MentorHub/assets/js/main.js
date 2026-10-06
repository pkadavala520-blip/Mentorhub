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
