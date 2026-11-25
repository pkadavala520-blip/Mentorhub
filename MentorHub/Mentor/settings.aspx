<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Settings" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Settings | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />

    <style>
        /* =========================================================
   MENTORHUB - SETTINGS (load AFTER mentor-panel.css)
   ========================================================= */
        :root {
            --st-primary: #5735e8;
            --st-primary-2: #7c5cff;
            --st-soft: #f2efff;
            --st-border: #eceaf3;
            --st-ink: #25213a;
            --st-muted: #77758a;
            --st-card: #ffffff;
            --st-field: #faf9ff;
            --st-shadow: 0 8px 30px rgba(45, 35, 100, .07);
            --st-ease: cubic-bezier(.16, 1, .3, 1);
        }

        body.mentor-dark {
            --st-soft: #2d2745;
            --st-border: #39334e;
            --st-ink: #f2efff;
            --st-muted: #b7b1ca;
            --st-card: #211d32;
            --st-field: #29243d;
            --st-shadow: 0 18px 40px -20px rgba(0, 0, 0, .6);
        }

        body[data-page="settings"] {
            font-family: 'Poppins', sans-serif;
        }

            body[data-page="settings"] .content-area {
                min-width: 0;
                min-height: 100vh;
                background: radial-gradient(ellipse at 10% 10%, rgba(151,113,255,.16), transparent 38%), radial-gradient(ellipse at 90% 90%, rgba(101,153,255,.12), transparent 38%);
            }


        /* ---------- Hero banner ---------- */
        .st-hero {
            position: relative;
            overflow: hidden;
            margin-bottom: 26px;
            padding: 28px 32px;
            color: #fff;
            border-radius: 22px;
            background: radial-gradient(420px 220px at 95% 0%, rgba(240,171,252,.45), transparent 65%), radial-gradient(360px 220px at 0% 100%, rgba(56,189,248,.28), transparent 65%), linear-gradient(120deg, #4526c9, #6d4bff 55%, #a855f7);
            box-shadow: 0 26px 50px -26px rgba(87,53,232,.8);
        }

            .st-hero::after {
                content: "";
                position: absolute;
                top: -50%;
                left: -40%;
                width: 40%;
                height: 200%;
                background: linear-gradient(100deg, transparent, rgba(255,255,255,.16), transparent);
                transform: rotate(18deg);
                animation: stSweep 8s ease-in-out infinite;
                pointer-events: none;
            }

        @keyframes stSweep {
            0% {
                left: -40%;
            }

            55%, 100% {
                left: 130%;
            }
        }

        .st-hero > * {
            position: relative;
            z-index: 1;
        }

        .st-hero .st-eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 6px 13px;
            border-radius: 30px;
            background: rgba(255,255,255,.18);
            font-size: 12px;
            font-weight: 700;
        }

        .st-hero h2 {
            margin: 14px 0 4px;
            color: #fff;
            font-size: 30px;
            font-weight: 800;
            letter-spacing: -.7px;
        }

        .st-hero p {
            margin: 0;
            opacity: .9;
            font-size: 13px;
        }

        /* ---------- Cards ---------- */
        body[data-page="settings"] .mp-card {
            background: var(--st-card);
            border: 1px solid var(--st-border);
            border-radius: 20px;
            box-shadow: var(--st-shadow);
            transition: box-shadow .35s;
        }

            body[data-page="settings"] .mp-card:hover {
                box-shadow: 0 22px 44px -22px rgba(87,53,232,.4);
            }

        .st-side {
            padding: 20px !important;
            position: sticky;
            top: 16px;
        }

        .tab-content .mp-card {
            padding: 28px !important;
        }

        .st-head {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 22px;
        }

            .st-head .st-ico {
                width: 46px;
                height: 46px;
                flex: 0 0 46px;
                display: grid;
                place-items: center;
                border-radius: 14px;
                color: #fff;
                font-size: 20px;
                background: linear-gradient(135deg, #6366f1, #a855f7);
                box-shadow: 0 10px 18px -10px rgba(87,53,232,.8);
            }

            .st-head h5 {
                margin: 0;
                color: var(--st-ink);
                font-size: 18px;
                font-weight: 700;
            }

            .st-head p {
                margin: 2px 0 0;
                color: var(--st-muted);
                font-size: 12px;
            }

            .st-head .mp-mini-label {
                margin-left: auto;
            }

        /* ---------- Profile card (photo) ---------- */
        .st-profile {
            text-align: center;
            padding: 8px 6px 20px;
            border-bottom: 1px solid var(--st-border);
        }

        .mp-settings-avatar {
            position: relative;
            width: 112px;
            height: 112px;
            margin: 0 auto 14px;
            overflow: hidden;
            border-radius: 50%;
            background: var(--st-soft);
            box-shadow: 0 10px 26px rgba(65,45,120,.22);
            transition: transform .35s var(--st-ease), box-shadow .35s;
        }

            .mp-settings-avatar:hover {
                transform: translateY(-3px) scale(1.03);
                box-shadow: 0 16px 32px rgba(65,45,120,.3);
            }

            .mp-settings-avatar::before, .mp-settings-avatar::after {
                display: none !important;
                content: none !important;
            }

        .settings-photo-image {
            position: absolute !important;
            inset: 0;
            z-index: 2;
            width: 100% !important;
            height: 100% !important;
            max-width: none;
            margin: 0;
            padding: 0;
            object-fit: cover;
            border: 0;
            border-radius: 50%;
        }

        .photo-fallback {
            position: absolute;
            inset: 0;
            z-index: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--st-soft);
            color: #6841df;
            font-size: 34px;
            font-weight: 700;
        }

        .photo-file-hidden {
            position: absolute !important;
            width: 1px;
            height: 1px;
            margin: -1px;
            padding: 0;
            overflow: hidden;
            opacity: 0;
            pointer-events: none;
            clip: rect(0,0,0,0);
        }

        .photo-upload-hidden {
            display: none !important;
        }

        .st-name {
            margin: 0;
            color: var(--st-ink);
            font-size: 16px;
            font-weight: 700;
            overflow-wrap: anywhere;
        }

        .st-email {
            display: block;
            margin-bottom: 14px;
            color: var(--st-muted);
            font-size: 12px;
            overflow-wrap: anywhere;
        }

        .change-photo-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            padding: 10px 20px;
            color: #fff;
            border: 0;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(120deg, #5735e8, #9239e9);
            font: 700 13px 'Poppins', sans-serif;
            box-shadow: 0 8px 18px rgba(87,53,232,.28);
            transition: transform .3s var(--st-ease), box-shadow .3s;
        }

            .change-photo-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 14px 26px rgba(87,53,232,.38);
            }

            .change-photo-btn:disabled {
                opacity: .7;
                cursor: wait;
                transform: none;
            }

        .photo-help {
            display: block;
            margin-top: 10px;
            color: var(--st-muted);
            font-size: 11px;
            line-height: 1.7;
        }

        /* ---------- Tab list ---------- */
        .st-nav {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-top: 16px;
        }

            .st-nav .nav-link {
                position: relative;
                display: flex;
                align-items: center;
                gap: 13px;
                padding: 11px 13px;
                border-radius: 14px;
                color: var(--st-muted);
                transition: background .3s, color .3s, transform .3s var(--st-ease), box-shadow .3s;
            }

                .st-nav .nav-link .st-nav-ico {
                    width: 38px;
                    height: 38px;
                    flex: 0 0 38px;
                    display: grid;
                    place-items: center;
                    border-radius: 11px;
                    background: var(--st-soft);
                    color: var(--st-primary);
                    font-size: 17px;
                    transition: background .3s, color .3s;
                }

                .st-nav .nav-link b {
                    display: block;
                    color: var(--st-ink);
                    font-size: 13px;
                    font-weight: 600;
                    line-height: 1.3;
                }

                .st-nav .nav-link small {
                    display: block;
                    font-size: 11px;
                    line-height: 1.3;
                }

                .st-nav .nav-link:hover {
                    background: var(--st-soft);
                    transform: translateX(4px);
                }

                .st-nav .nav-link.active {
                    background: linear-gradient(120deg, #7651f4, #8b43e9);
                    box-shadow: 0 10px 22px rgba(105,64,220,.3);
                }

                    .st-nav .nav-link.active b, .st-nav .nav-link.active small {
                        color: #fff;
                    }

                    .st-nav .nav-link.active .st-nav-ico {
                        background: rgba(255,255,255,.22);
                        color: #fff;
                    }

        /* ---------- Form fields ---------- */
        body[data-page="settings"] .form-label {
            color: var(--st-ink);
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        body[data-page="settings"] .form-control {
            min-height: 48px;
            padding: 12px 15px;
            color: var(--st-ink);
            background: var(--st-field);
            border: 1px solid var(--st-border);
            border-radius: 12px;
            font: 400 13px 'Poppins', sans-serif;
            transition: .25s;
        }

            body[data-page="settings"] .form-control:focus {
                color: var(--st-ink);
                background: var(--st-card);
                border-color: var(--st-primary);
                box-shadow: 0 0 0 4px rgba(87,53,232,.12);
            }

        .st-field-wrap {
            position: relative;
        }

            .st-field-wrap .form-control {
                padding-right: 46px;
            }

        .st-eye {
            position: absolute;
            right: 8px;
            top: 50%;
            transform: translateY(-50%);
            width: 34px;
            height: 34px;
            display: grid;
            place-items: center;
            border: 0;
            border-radius: 10px;
            background: transparent;
            color: var(--st-muted);
            cursor: pointer;
            transition: background .2s, color .2s;
        }

            .st-eye:hover {
                background: var(--st-soft);
                color: var(--st-primary);
            }

        /* password strength */
        .st-strength {
            margin-top: 10px;
        }

        .st-strength-bar {
            display: flex;
            gap: 5px;
        }

            .st-strength-bar span {
                flex: 1;
                height: 6px;
                border-radius: 6px;
                background: var(--st-soft);
                transition: background .3s;
            }

        .st-strength[data-level="1"] span:nth-child(-n+1) {
            background: #ef4444;
        }

        .st-strength[data-level="2"] span:nth-child(-n+2) {
            background: #f59e0b;
        }

        .st-strength[data-level="3"] span:nth-child(-n+3) {
            background: #6d4bff;
        }

        .st-strength[data-level="4"] span:nth-child(-n+4) {
            background: #10b981;
        }

        .st-strength small {
            display: block;
            margin-top: 6px;
            color: var(--st-muted);
            font-size: 11px;
        }

        /* ---------- Buttons ---------- */
        body[data-page="settings"] .mp-btn-primary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 46px;
            padding: 11px 24px;
            color: #fff !important;
            border: 0 !important;
            border-radius: 12px !important;
            cursor: pointer;
            background: linear-gradient(120deg, #5735e8, #9239e9) !important;
            font: 700 13px 'Poppins', sans-serif;
            box-shadow: 0 8px 18px rgba(87,53,232,.26);
            transition: transform .3s var(--st-ease), box-shadow .3s;
        }

            body[data-page="settings"] .mp-btn-primary:hover {
                transform: translateY(-3px);
                box-shadow: 0 14px 26px rgba(87,53,232,.38);
            }

            body[data-page="settings"] .mp-btn-primary:active {
                transform: scale(.98);
            }

        .st-actions {
            margin-top: 26px;
            padding-top: 20px;
            border-top: 1px dashed var(--st-border);
        }

        /* ---------- Setting rows + switches ---------- */
        .mp-setting-row {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
            padding: 18px 20px;
            margin-top: 14px;
            overflow: hidden;
            background: var(--st-field);
            border: 1px solid var(--st-border);
            border-radius: 16px;
            transition: transform .3s var(--st-ease), box-shadow .3s, border-color .25s;
        }

            .mp-setting-row::before {
                content: "";
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 4px;
                background: linear-gradient(180deg, #6d4bff, #d946ef);
                transform: scaleY(.3);
                opacity: 0;
                transition: transform .35s, opacity .25s;
            }

            .mp-setting-row:hover {
                transform: translateY(-2px);
                border-color: rgba(109,75,255,.4);
                box-shadow: 0 10px 22px -12px rgba(87,53,232,.4);
            }

                .mp-setting-row:hover::before {
                    transform: scaleY(1);
                    opacity: 1;
                }

        .st-row-main {
            display: flex;
            align-items: center;
            gap: 14px;
            min-width: 0;
        }

        .st-row-ico {
            width: 42px;
            height: 42px;
            flex: 0 0 42px;
            display: grid;
            place-items: center;
            border-radius: 12px;
            background: var(--st-soft);
            color: var(--st-primary);
            font-size: 18px;
        }

        .mp-setting-row strong {
            display: block;
            margin-bottom: 3px;
            color: var(--st-ink);
            font-size: 13px;
        }

        .mp-setting-row .text-muted {
            font-size: 12px;
        }

        /* asp:CheckBox renders <span class="st-toggle"><input></span> */
        .st-toggle {
            display: inline-flex;
            flex-shrink: 0;
        }

            .st-toggle input[type="checkbox"] {
                -webkit-appearance: none;
                appearance: none;
                width: 50px;
                height: 28px;
                margin: 0;
                cursor: pointer;
                border: 0;
                border-radius: 999px;
                background-color: #d8dbe8;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3E%3Ccircle r='3' fill='%23fff'/%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-size: 24px 24px;
                background-position: left 2px center;
                box-shadow: inset 0 1px 3px rgba(0,0,0,.15);
                transition: background-color .3s, background-position .3s cubic-bezier(.34,1.56,.64,1), box-shadow .25s;
            }

                .st-toggle input[type="checkbox"]:checked {
                    background-color: var(--st-primary);
                    background-position: right 2px center;
                }

                .st-toggle input[type="checkbox"]:hover {
                    box-shadow: 0 0 0 4px rgba(124,58,237,.16);
                }

                .st-toggle input[type="checkbox"]:focus-visible {
                    outline: none;
                    box-shadow: 0 0 0 4px rgba(87,53,232,.25);
                }

        body.mentor-dark .st-toggle input[type="checkbox"] {
            background-color: #3a3354;
        }

            body.mentor-dark .st-toggle input[type="checkbox"]:checked {
                background-color: var(--st-primary);
            }

        /* ---------- Availability ---------- */
        .availability-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0,1fr));
            gap: 15px;
        }

        .availability-box {
            min-width: 0;
            display: flex;
            align-items: flex-start;
            gap: 13px;
            padding: 19px;
            background: linear-gradient(135deg, rgba(99,102,241,.08), rgba(217,70,239,.06));
            border: 1px solid var(--st-border);
            border-radius: 16px;
            transition: transform .35s var(--st-ease), box-shadow .35s, border-color .25s;
        }

            .availability-box:hover {
                transform: translateY(-4px);
                border-color: rgba(109,75,255,.4);
                box-shadow: 0 16px 30px -16px rgba(87,53,232,.5);
            }

        .availability-icon {
            width: 44px;
            height: 44px;
            flex: 0 0 44px;
            display: grid;
            place-items: center;
            border-radius: 13px;
            color: #fff;
            font-size: 19px;
            background: linear-gradient(135deg, #6366f1, #a855f7);
            box-shadow: 0 8px 16px -8px rgba(87,53,232,.7);
            transition: transform .4s var(--st-ease);
        }

        .availability-box:hover .availability-icon {
            transform: rotate(-8deg) scale(1.08);
        }

        .availability-box small {
            display: block;
            margin-bottom: 6px;
            color: var(--st-muted);
            font-size: 11px;
        }

        .availability-box strong {
            display: block;
            color: var(--st-ink);
            font-size: 13px;
            line-height: 1.7;
            overflow-wrap: anywhere;
        }

        .availability-edit {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 11px 18px;
            color: #fff !important;
            border-radius: 12px;
            text-decoration: none;
            background: linear-gradient(120deg, #5735e8, #9239e9);
            font-size: 12px;
            font-weight: 700;
            box-shadow: 0 8px 18px rgba(87,53,232,.26);
            transition: transform .3s, box-shadow .3s;
        }

            .availability-edit:hover {
                transform: translateY(-3px);
                box-shadow: 0 14px 26px rgba(87,53,232,.38);
            }

        .st-note {
            display: flex;
            gap: 10px;
            align-items: flex-start;
            margin-top: 22px;
            padding: 16px;
            border-radius: 14px;
            background: var(--st-soft);
            border: 1px solid var(--st-border);
            color: var(--st-muted);
            font-size: 12px;
            line-height: 1.7;
        }

            .st-note i {
                color: var(--st-primary);
                font-size: 18px;
            }

        .mp-mini-label {
            padding: 7px 13px;
            border-radius: 30px;
            background: var(--st-soft);
            color: var(--st-primary);
            font-size: 11px;
            font-weight: 700;
        }

        /* ---------- Tab animation, alerts ---------- */
        .tab-pane.active.show {
            animation: stFade .35s ease both;
        }

        @keyframes stFade {
            from {
                opacity: 0;
                transform: translateY(10px);
            }

            to {
                opacity: 1;
                transform: none;
            }
        }

        body[data-page="settings"] .alert {
            border-radius: 14px;
            font-size: 13px;
        }

        /* ---------- Sidebar mini photo ---------- */
        .mp-mini-photo {
            position: relative;
            width: 42px;
            height: 42px;
            flex: 0 0 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border-radius: 50%;
            background: var(--st-soft);
        }

            .mp-mini-photo img {
                position: absolute;
                inset: 0;
                z-index: 2;
                display: block;
                width: 100%;
                height: 100%;
                object-fit: cover;
                border: 0 !important;
                border-radius: 50%;
            }

            .mp-mini-photo .mp-avatar {
                position: absolute;
                inset: 0;
                z-index: 1;
                display: flex !important;
                width: 100%;
                height: 100%;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                box-shadow: none;
            }

        body[data-page="settings"].mentor-dark .text-muted {
            color: var(--st-muted) !important;
        }

        body.mentor-dark .photo-fallback {
            color: #d8ccff;
        }

        /* ---------- Responsive ---------- */
        @media (max-width: 1199px) {
            .st-side {
                position: static;
            }
        }

        @media (max-width: 767px) {
            body[data-page="settings"] .content-area {
                padding: 16px !important;
            }

            .st-hero {
                padding: 22px 20px;
            }

                .st-hero h2 {
                    font-size: 24px;
                }

            .tab-content .mp-card {
                padding: 20px !important;
            }

            .availability-grid {
                grid-template-columns: 1fr;
            }

            .st-head .mp-mini-label {
                display: none;
            }

            .mp-topbar {
                padding: 12px !important;
            }
        }

        @media (max-width: 576px) {
            body[data-page="settings"] .mp-icon-btn {
                width: 40px;
                height: 40px;
            }

            .mp-topbar-right {
                gap: 6px;
            }

            .st-row-ico {
                display: none;
            }

            .mp-notification-dropdown {
                position: absolute;
                right: -45px !important;
                left: auto !important;
                width: min(350px, calc(100vw - 24px));
                max-width: calc(100vw - 20px);
            }
        }

        @media (prefers-reduced-motion: reduce) {
            body[data-page="settings"] *, body[data-page="settings"] *::before, body[data-page="settings"] *::after {
                animation-duration: .01ms !important;
                transition-duration: .01ms !important;
            }
        }

        /* ===== TOP HEADER ALIGNMENT / SPACING FIX ===== */
        body[data-page="settings"] .mp-topbar,
        body[data-page="notifications"] .mp-topbar {
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            gap: 18px !important;
            width: 100%;
            min-height: 72px;
            padding: 14px 18px !important;
            box-sizing: border-box;
            border-radius: 20px;
        }

            body[data-page="settings"] .mp-topbar-left,
            body[data-page="notifications"] .mp-topbar > .d-flex:first-child {
                display: flex;
                align-items: center;
                gap: 14px;
                min-width: 0;
            }

            body[data-page="settings"] .mp-topbar-right,
            body[data-page="notifications"] .mp-topbar > .d-flex:last-child {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: 10px;
                flex-shrink: 0;
            }

        body[data-page="settings"] .mp-search,
        body[data-page="notifications"] .mp-search {
            width: min(315px, 38vw);
            min-height: 48px;
        }

            body[data-page="settings"] .mp-search input,
            body[data-page="notifications"] .mp-search input {
                width: 100%;
            }

        body[data-page="settings"] .mp-icon-btn,
        body[data-page="notifications"] .mp-icon-btn {
            width: 44px;
            height: 44px;
            border-radius: 13px;
        }

        @media(max-width:767px) {
            body[data-page="settings"] .mp-topbar,
            body[data-page="notifications"] .mp-topbar {
                min-height: 60px;
                padding: 10px 12px !important;
                gap: 8px !important;
            }

                body[data-page="settings"] .mp-topbar-left,
                body[data-page="notifications"] .mp-topbar > .d-flex:first-child {
                    gap: 8px;
                }

                body[data-page="settings"] .mp-topbar-right,
                body[data-page="notifications"] .mp-topbar > .d-flex:last-child {
                    gap: 6px;
                }
        }


        /* ===== SETTINGS PAGE STRUCTURE FIX (dropdown CSS stays shared) ===== */
        body[data-page="settings"] .content-area {
            width: 100%;
            min-width: 0;
            max-width: 100%;
            box-sizing: border-box;
            padding: clamp(16px, 2vw, 30px) !important;
            overflow-x: clip;
        }

        body[data-page="settings"] .mp-topbar {
            position: relative;
            z-index: 30;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            min-height: 76px;
            margin-bottom: 24px !important;
            overflow: visible !important;
            box-sizing: border-box;
        }

        body[data-page="settings"] .mp-topbar-left,
        body[data-page="settings"] .mp-topbar-right {
            display: flex;
            align-items: center;
            min-width: 0;
        }

        body[data-page="settings"] .mp-topbar-right {
            gap: 10px;
            flex-shrink: 0;
            margin-left: auto;
        }

        body[data-page="settings"] .mp-topbar .dropdown {
            position: relative;
            flex: 0 0 auto;
        }

        body[data-page="settings"] .mp-topbar .dropdown-menu {
            z-index: 1080;
        }

        body[data-page="settings"] .st-hero {
            display: block;
            width: 100%;
            margin: 0 0 24px;
            box-sizing: border-box;
        }

        body[data-page="settings"] .row.g-4 {
            width: 100%;
            min-width: 0;
            margin-left: 0;
            margin-right: 0;
            align-items: flex-start;
        }

        body[data-page="settings"] .row.g-4 > [class*="col-"] {
            min-width: 0;
        }

        body[data-page="settings"] .st-side,
        body[data-page="settings"] .tab-content,
        body[data-page="settings"] .tab-content .mp-card {
            width: 100%;
            max-width: 100%;
            min-width: 0;
            box-sizing: border-box;
        }

        body[data-page="settings"] .st-head {
            display: flex;
            align-items: center;
            gap: 14px;
            flex-wrap: wrap;
        }

        body[data-page="settings"] .st-head > div {
            min-width: 0;
            flex: 1 1 220px;
        }

        body[data-page="settings"] .st-head h5 {
            margin: 0 0 5px;
        }

        body[data-page="settings"] .st-head p {
            margin: 0;
            overflow-wrap: anywhere;
        }

        @media (max-width: 991.98px) {
            body[data-page="settings"] .row.g-4 {
                row-gap: 18px !important;
            }
            body[data-page="settings"] .st-side {
                position: static;
            }
        }

        @media (max-width: 767.98px) {
            body[data-page="settings"] .mp-topbar {
                min-height: 62px;
                padding: 12px !important;
                gap: 8px;
            }
            body[data-page="settings"] .mp-topbar-right {
                gap: 6px;
            }
            body[data-page="settings"] .st-hero {
                padding: 22px 20px;
            }
            body[data-page="settings"] .st-head {
                align-items: flex-start;
            }
        }
    </style>
</head>

<body id="bodyMain" runat="server" class="mentor-shell" data-page="settings">

    <form id="form1" runat="server" enctype="multipart/form-data">

        <div class="d-flex">

            <!-- ================= SIDEBAR ================= -->
            <aside class="sidebar mp-sidebar">

                <div class="mp-brand">
                    <div class="mp-brand-mark"><i class="bi bi-mortarboard-fill"></i></div>
                    <div class="mp-brand-text">
                        <h4>MentorHub</h4>
                        <span>Mentor Panel</span>
                    </div>
                </div>

                <nav class="mp-nav nav flex-column" aria-label="Mentor navigation">

                    <div class="mp-nav-section-label">Overview</div>
                    <a class="nav-link" href="index.aspx"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a>
                    <a class="nav-link" href="profile.aspx"><i class="bi bi-person"></i><span>My Profile</span></a>
                    <a class="nav-link" href="my-skills.aspx"><i class="bi bi-lightbulb"></i><span>My Skills</span></a>

                    <div class="mp-nav-section-label">Mentoring</div>
                    <a class="nav-link" href="availability.aspx"><i class="bi bi-calendar2-week"></i><span>Availability</span></a>

                    <a class="nav-link" href="requests.aspx">
                        <i class="bi bi-ui-checks"></i>
                        <span>Matching Requests</span>
                        <span class="mp-nav-badge">
                            <asp:Label ID="lblSidebarRequests" runat="server" Text="0"></asp:Label></span>
                    </a>

                    <a class="nav-link" href="mentees.aspx"><i class="bi bi-people"></i><span>My Mentees</span></a>

                    <a class="nav-link" href="messages.aspx">
                        <i class="bi bi-chat-dots"></i>
                        <span>Messages</span>
                        <span class="mp-nav-badge">
                            <asp:Label ID="lblSidebarMessages" runat="server" Text="0"></asp:Label></span>
                    </a>

                    <a class="nav-link" href="schedule.aspx"><i class="bi bi-calendar2-event"></i><span>Schedule</span></a>

                    <div class="mp-nav-section-label">Insights</div>
                    <a class="nav-link" href="feedback.aspx"><i class="bi bi-star"></i><span>Feedback &amp; Reviews</span></a>

                    <a class="nav-link" href="notifications.aspx">
                        <i class="bi bi-bell"></i>
                        <span>Notifications</span>
                        <span class="mp-nav-badge">
                            <asp:Label ID="lblSidebarNotifications" runat="server" Text="0"></asp:Label></span>
                    </a>

                    <div class="mp-nav-section-label">Account</div>
                    <a class="nav-link active" href="settings.aspx" aria-current="page"><i class="bi bi-gear"></i><span>Settings</span></a>

                </nav>

                <div class="mp-sidebar-footer">

                    <div class="mp-mini-profile mb-2">
                        <div class="mp-mini-photo">
                            <asp:Image ID="imgSidebarAvatar" runat="server" AlternateText="Mentor profile" Visible="false" />
                            <asp:Label ID="lblSidebarFallback" runat="server" CssClass="mp-avatar sm" Text="M" />
                        </div>

                        <div class="mp-mini-profile-text">
                            <strong>
                                <asp:Label ID="lblMiniName" runat="server" Text="Mentor"></asp:Label></strong>
                            <span><span class="mp-status-dot d-inline-block me-1"></span>Active now</span>
                        </div>
                    </div>

                    <a class="nav-link mp-danger" href="../Home/SignIn_up.aspx">
                        <i class="bi bi-box-arrow-right"></i><span>Logout</span>
                    </a>

                </div>
            </aside>

            <!-- ================= MAIN ================= -->
            <main class="flex-grow-1 content-area p-4">

                <!-- TOPBAR -->
                <div class="mp-topbar mb-4">

                    <div class="mp-topbar-left">
                        <button type="button" class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false">
                            <i class="bi bi-list"></i>
                        </button>

                        <div class="mp-search d-none d-md-block">
                            <i class="bi bi-search"></i>
                            <input type="text" placeholder="Search mentees, requests, sessions..." disabled />
                        </div>
                    </div>

                    <div class="mp-topbar-right">

                        <label class="mp-icon-btn" title="Toggle dark mode" style="cursor: pointer;">
                            <input type="checkbox" data-dark-toggle class="visually-hidden" />
                            <i class="bi bi-moon-stars"></i>
                        </label>

                        <!-- SINGLE DYNAMIC NOTIFICATION BELL -->
                        <div class="dropdown">

                            <button class="mp-icon-btn"
                                id="notificationBell"
                                type="button"
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="true"
                                aria-expanded="false"
                                aria-label="Open notifications">

                                <i class="bi bi-bell"></i>

                                <asp:Label ID="lblNotifDot"
                                    runat="server"
                                    CssClass="mp-dot"
                                    Text=" "
                                    Visible="false">
                                </asp:Label>

                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-notification-dropdown"
                                aria-labelledby="notificationBell">

                                <div class="d-flex">
                                    <span class="notification-heading">
                                        <i class="bi bi-bell"></i>
                                        Notifications
                                    </span>
                                    <a href="notifications.aspx" class="notification-view-all">View all</a>
                                </div>

                                <asp:Repeater ID="rptTopNotifications" runat="server">
                                    <ItemTemplate>

                                        <div class='<%# Convert.ToBoolean(Eval("IsRead")) ? "mp-notif-item" : "mp-notif-item unread" %>'
                                            data-type='<%# Eval("NotificationType") %>'>

                                            <a href="notifications.aspx">
                                                <div class="mp-notif-body">
                                                    <div class="mp-notif-title"><%#: Eval("Title") %></div>
                                                    <div class="mp-notif-text"><%#: Eval("Message") %></div>
                                                    <div class="mp-notif-time">
                                                        <%# Eval("CreatedAt", "{0:dd MMM yyyy, hh:mm tt}") %>
                                                    </div>
                                                </div>
                                            </a>

                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:Panel ID="pnlTopEmpty"
                                    runat="server"
                                    Visible="false"
                                    CssClass="notification-empty">

                                    <i class="bi bi-bell-slash"></i>
                                    <p>No notifications yet.</p>

                                </asp:Panel>

                            </div>

                        </div> <!-- .mp-topbar-right -->

                    </div> <!-- .mp-topbar -->

                    <!-- HERO -->
                        <div class="st-hero fade-in">
                            <span class="st-eyebrow"><i class="bi bi-gear-fill"></i>Settings</span>
                            <h2>Account settings</h2>
                            <p>Manage your profile, notifications, appearance, and security.</p>
                        </div>

                        <!-- MESSAGE -->
                        <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert alert-success mb-4">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </asp:Panel>

                        <!-- LAYOUT -->
                        <div class="row g-4">

                            <!-- LEFT: PROFILE + TABS -->
                            <div class="col-xl-3 col-lg-4 fade-in">

                                <div class="mp-card st-side">

                                    <div class="st-profile">

                                        <div class="mp-settings-avatar" id="settingsAvatar">
                                            <asp:Label ID="lblPhotoFallback" runat="server" CssClass="photo-fallback" Text="M" />
                                            <asp:Image ID="imgSettingsPhoto" runat="server" AlternateText="Profile photo"
                                                CssClass="settings-photo-image" Visible="false" />
                                        </div>

                                        <h6 class="st-name" id="stName">Mentor</h6>
                                        <span class="st-email" id="stEmail"></span>

                                        <asp:FileUpload ID="fuProfilePhoto" runat="server"
                                            CssClass="photo-file-hidden" accept=".jpg,.jpeg,.png" />

                                        <button type="button" class="change-photo-btn" id="btnChangePhoto">
                                            <i class="bi bi-camera-fill"></i><span>Change Photo</span>
                                        </button>

                                        <asp:Button ID="btnUploadPhoto" runat="server" Text="Upload Photo"
                                            CssClass="photo-upload-hidden" OnClick="btnUploadPhoto_Click"
                                            CausesValidation="false" UseSubmitBehavior="false" />

                                        <span class="photo-help">JPG, JPEG or PNG &bull; Maximum 2 MB</span>

                                    </div>

                                    <nav class="st-nav" role="tablist">

                                        <a class="nav-link active" data-bs-toggle="tab" href="#mpTabAccount" role="tab" aria-selected="true">
                                            <span class="st-nav-ico"><i class="bi bi-person"></i></span>
                                            <span><b>Account</b><small>Name, email, phone</small></span>
                                        </a>

                                        <a class="nav-link" data-bs-toggle="tab" href="#mpTabNotif" role="tab" aria-selected="false">
                                            <span class="st-nav-ico"><i class="bi bi-bell"></i></span>
                                            <span><b>Notifications</b><small>Email and SMS alerts</small></span>
                                        </a>

                                        <a class="nav-link" data-bs-toggle="tab" href="#mpTabAvailability" role="tab" aria-selected="false">
                                            <span class="st-nav-ico"><i class="bi bi-calendar2-week"></i></span>
                                            <span><b>Availability</b><small>Your mentoring schedule</small></span>
                                        </a>

                                        <a class="nav-link" data-bs-toggle="tab" href="#mpTabAppearance" role="tab" aria-selected="false">
                                            <span class="st-nav-ico"><i class="bi bi-palette"></i></span>
                                            <span><b>Appearance</b><small>Light or dark mode</small></span>
                                        </a>

                                        <a class="nav-link" data-bs-toggle="tab" href="#mpTabSecurity" role="tab" aria-selected="false">
                                            <span class="st-nav-ico"><i class="bi bi-shield-lock"></i></span>
                                            <span><b>Security</b><small>Change your password</small></span>
                                        </a>

                                    </nav>

                                </div>
                            </div>

                            <!-- RIGHT: CONTENT -->
                            <div class="col-xl-9 col-lg-8 fade-in">

                                <div class="tab-content">

                                    <!-- ACCOUNT -->
                                    <div class="tab-pane fade show active" id="mpTabAccount" role="tabpanel">
                                        <div class="mp-card">

                                            <div class="st-head">
                                                <span class="st-ico"><i class="bi bi-person-vcard"></i></span>
                                                <div>
                                                    <h5>Profile preferences</h5>
                                                    <p>The details mentees and the system use to reach you.</p>
                                                </div>
                                                <span class="mp-mini-label"><i class="bi bi-database-check me-1"></i>Database connected</span>
                                            </div>

                                            <div class="row g-3">

                                                <div class="col-md-6">
                                                    <label class="form-label">Display Name</label>
                                                    <asp:TextBox ID="txtDisplayName" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label">Notification Email</label>
                                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" MaxLength="150"></asp:TextBox>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label">Phone Number</label>
                                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                                </div>

                                            </div>

                                            <div class="st-actions">
                                                <asp:Button ID="btnSaveProfile" runat="server" Text="Save Preferences"
                                                    CssClass="mp-btn-primary" OnClick="btnSaveProfile_Click" />
                                            </div>

                                        </div>
                                    </div>

                                    <!-- NOTIFICATIONS -->
                                    <div class="tab-pane fade" id="mpTabNotif" role="tabpanel">
                                        <div class="mp-card">

                                            <div class="st-head">
                                                <span class="st-ico"><i class="bi bi-bell"></i></span>
                                                <div>
                                                    <h5>Notification preferences</h5>
                                                    <p>Choose how MentorHub keeps you updated.</p>
                                                </div>
                                            </div>

                                            <div class="mp-setting-row">
                                                <div class="st-row-main">
                                                    <span class="st-row-ico"><i class="bi bi-envelope"></i></span>
                                                    <div>
                                                        <strong>Email Notifications</strong>
                                                        <div class="text-muted small">Receive mentoring requests and important updates through email.</div>
                                                    </div>
                                                </div>
                                                <asp:CheckBox ID="chkEmailNotifications" runat="server" CssClass="st-toggle" />
                                            </div>

                                            <div class="mp-setting-row">
                                                <div class="st-row-main">
                                                    <span class="st-row-ico"><i class="bi bi-chat-left-text"></i></span>
                                                    <div>
                                                        <strong>SMS Notifications</strong>
                                                        <div class="text-muted small">Receive important alerts and reminders through SMS.</div>
                                                    </div>
                                                </div>
                                                <asp:CheckBox ID="chkSMSNotifications" runat="server" CssClass="st-toggle" />
                                            </div>

                                            <div class="st-actions">
                                                <asp:Button ID="btnSaveNotifications" runat="server" Text="Save Notification Settings"
                                                    CssClass="mp-btn-primary" OnClick="btnSaveNotifications_Click" />
                                            </div>

                                        </div>
                                    </div>

                                    <!-- AVAILABILITY -->
                                    <div class="tab-pane fade" id="mpTabAvailability" role="tabpanel">
                                        <div class="mp-card">

                                            <div class="st-head">
                                                <span class="st-ico"><i class="bi bi-calendar2-week"></i></span>
                                                <div>
                                                    <h5>My Availability</h5>
                                                    <p>Your saved mentoring availability.</p>
                                                </div>
                                                <a class="availability-edit ms-auto" href="availability.aspx">
                                                    <i class="bi bi-pencil-square"></i>Edit Schedule
                                                </a>
                                            </div>

                                            <div class="availability-grid">

                                                <div class="availability-box">
                                                    <div class="availability-icon"><i class="bi bi-calendar2-check"></i></div>
                                                    <div>
                                                        <small>Available days / schedule</small>
                                                        <strong>
                                                            <asp:Label ID="lblAvailabilityDays" runat="server" Text="No availability added yet"></asp:Label>
                                                        </strong>
                                                    </div>
                                                </div>

                                                <div class="availability-box">
                                                    <div class="availability-icon"><i class="bi bi-clock"></i></div>
                                                    <div>
                                                        <small>Availability details</small>
                                                        <strong>
                                                            <asp:Label ID="lblAvailabilityTime" runat="server" Text="Manage your time slots"></asp:Label>
                                                        </strong>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="st-note">
                                                <i class="bi bi-info-circle-fill"></i>
                                                <div>
                                                    To add, edit, or remove your mentoring time slots, open the Availability page.
                                            Your saved schedule is displayed here from your mentor profile.
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <!-- APPEARANCE -->
                                    <div class="tab-pane fade" id="mpTabAppearance" role="tabpanel">
                                        <div class="mp-card">

                                            <div class="st-head">
                                                <span class="st-ico"><i class="bi bi-palette"></i></span>
                                                <div>
                                                    <h5>Appearance</h5>
                                                    <p>Customize how MentorHub looks.</p>
                                                </div>
                                            </div>

                                            <div class="mp-setting-row">
                                                <div class="st-row-main">
                                                    <span class="st-row-ico"><i class="bi bi-moon-stars"></i></span>
                                                    <div>
                                                        <strong>Dark Mode</strong>
                                                        <div class="text-muted small">Enable a darker appearance for your dashboard.</div>
                                                    </div>
                                                </div>
                                                <asp:CheckBox ID="chkDarkMode" runat="server" CssClass="st-toggle" />
                                            </div>

                                            <div class="st-actions">
                                                <asp:Button ID="btnSaveAppearance" runat="server" Text="Save Appearance"
                                                    CssClass="mp-btn-primary" OnClick="btnSaveAppearance_Click" />
                                            </div>

                                        </div>
                                    </div>

                                    <!-- SECURITY -->
                                    <div class="tab-pane fade" id="mpTabSecurity" role="tabpanel">
                                        <div class="mp-card">

                                            <div class="st-head">
                                                <span class="st-ico"><i class="bi bi-shield-lock"></i></span>
                                                <div>
                                                    <h5>Security</h5>
                                                    <p>Change your MentorHub account password.</p>
                                                </div>
                                            </div>

                                            <div class="row g-3">

                                                <div class="col-md-6">
                                                    <label class="form-label">Current Password</label>
                                                    <div class="st-field-wrap">
                                                        <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                        <button type="button" class="st-eye" data-eye aria-label="Show password"><i class="bi bi-eye"></i></button>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label">New Password</label>
                                                    <div class="st-field-wrap">
                                                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                        <button type="button" class="st-eye" data-eye aria-label="Show password"><i class="bi bi-eye"></i></button>
                                                    </div>

                                                    <div class="st-strength" id="pwStrength" data-level="0">
                                                        <div class="st-strength-bar"><span></span><span></span><span></span><span></span></div>
                                                        <small id="pwHint">Use 8+ characters with letters, numbers and symbols.</small>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="st-actions">
                                                <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password"
                                                    CssClass="mp-btn-primary" OnClick="btnUpdatePassword_Click" />
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
            </main>
        </div>

    </form>

    <!-- SCRIPTS (mentor-profile-sync.js is not loaded: this page renders the photo on the server) -->
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/mentor-app.js?v=1"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {

            /* ---------- profile card text ---------- */
            var miniName = document.getElementById("<%= lblMiniName.ClientID %>");
            var emailBox = document.getElementById("<%= txtEmail.ClientID %>");
            var nameEl = document.getElementById("stName");
            var emailEl = document.getElementById("stEmail");

            if (miniName && nameEl && miniName.textContent.trim()) {
                nameEl.textContent = miniName.textContent.trim();
            }
            if (emailBox && emailEl) {
                emailEl.textContent = emailBox.value;
            }

            /* ---------- photo upload ---------- */
            var fileInput = document.getElementById("<%= fuProfilePhoto.ClientID %>");
            var uploadBtn = document.getElementById("<%= btnUploadPhoto.ClientID %>");
            var changeBtn = document.getElementById("btnChangePhoto");
            var avatarBox = document.getElementById("settingsAvatar");

            if (fileInput && uploadBtn && changeBtn && avatarBox) {

                changeBtn.addEventListener("click", function () { fileInput.click(); });

                fileInput.addEventListener("change", function () {

                    var file = fileInput.files && fileInput.files[0];
                    if (!file) { return; }

                    if (!/\.(jpe?g|png)$/i.test(file.name)) {
                        alert("Please select a JPG, JPEG or PNG image.");
                        fileInput.value = "";
                        return;
                    }

                    if (file.size > 2 * 1024 * 1024) {
                        alert("The image size must be less than 2 MB.");
                        fileInput.value = "";
                        return;
                    }

                    var reader = new FileReader();

                    reader.onload = function (e) {
                        // the <img> is not rendered when there is no photo yet, so create it
                        var img = avatarBox.querySelector("img");
                        if (!img) {
                            img = document.createElement("img");
                            img.alt = "Profile photo";
                            img.className = "settings-photo-image";
                            avatarBox.appendChild(img);
                        }
                        img.src = e.target.result;
                        img.style.display = "block";

                        var fb = avatarBox.querySelector(".photo-fallback");
                        if (fb) { fb.style.display = "none"; }
                    };

                    reader.readAsDataURL(file);

                    changeBtn.disabled = true;
                    changeBtn.querySelector("span").textContent = "Uploading...";

                    setTimeout(function () { uploadBtn.click(); }, 200);
                });
            }

            /* ---------- show / hide password ---------- */
            document.querySelectorAll("[data-eye]").forEach(function (btn) {
                btn.addEventListener("click", function () {
                    var input = btn.parentNode.querySelector("input");
                    var icon = btn.querySelector("i");
                    if (!input) { return; }

                    var show = input.type === "password";
                    input.type = show ? "text" : "password";
                    icon.className = show ? "bi bi-eye-slash" : "bi bi-eye";
                });
            });

            /* ---------- password strength ---------- */
            var pw = document.getElementById("<%= txtNewPassword.ClientID %>");
            var meter = document.getElementById("pwStrength");
            var hint = document.getElementById("pwHint");

            if (pw && meter && hint) {
                var labels = ["Use 8+ characters with letters, numbers and symbols.", "Weak", "Fair", "Good", "Strong"];

                pw.addEventListener("input", function () {
                    var v = pw.value, score = 0;
                    if (v.length >= 8) score++;
                    if (/[a-z]/.test(v) && /[A-Z]/.test(v)) score++;
                    if (/\d/.test(v)) score++;
                    if (/[^A-Za-z0-9]/.test(v)) score++;
                    if (!v.length) score = 0;

                    meter.setAttribute("data-level", score);
                    hint.textContent = labels[score];
                });
            }

            /* ---------- notification dropdown ---------- */
            var bell = document.getElementById("notificationBell");
            if (bell && window.bootstrap) {
                bootstrap.Dropdown.getOrCreateInstance(bell);
            }
        });
    </script>

</body>
</html>
