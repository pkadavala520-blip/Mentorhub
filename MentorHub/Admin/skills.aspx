<%@ Page Title="Skills Directory" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="skills.aspx.cs" Inherits="MentorHub.Admin.skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .skills-wrapper {
            box-sizing: border-box;
            width: 100%;
            max-width: 100%;
            min-height: 100vh;
            padding: 28px;
            border-radius: 24px;
            background:
                radial-gradient(circle at top left, #eee7ff 0, transparent 40%),
                linear-gradient(135deg, #f7f5ff, #f2f6ff);
        }

        .skills-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
            margin-bottom: 28px;
        }

        .skills-title {
            color: #20284b;
            font-size: 27px;
            font-weight: 750;
            margin: 0 0 6px;
        }

        .skills-subtitle {
            color: #7c86a5;
            margin: 0;
            font-size: 14px;
        }

        .skills-add-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            white-space: nowrap;
            background: linear-gradient(135deg, #6545ed, #a13ce8);
            color: #fff !important;
            padding: 11px 19px;
            border: none;
            border-radius: 13px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 7px 18px rgba(112, 67, 230, .22);
            transition: transform .25s ease, box-shadow .25s ease;
        }

        .skills-add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 23px rgba(112, 67, 230, .3);
            color: #fff !important;
        }

        .skills-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
            width: 100%;
            align-items: stretch;
        }

        .skills-grid > span {
            display: contents;
        }

        .skill-card {
            position: relative;
            box-sizing: border-box;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            width: 100%;
            min-width: 0;
            min-height: 110px;
            padding: 24px;
            overflow: hidden;
            background: rgba(255, 255, 255, .92);
            border: 1px solid #e1dcff;
            border-radius: 22px;
            box-shadow: 0 8px 22px rgba(75, 60, 150, .08);
            transition:
                transform .25s ease,
                box-shadow .25s ease,
                border-color .25s ease;
        }

        .skill-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(
                90deg,
                #35b8ff,
                #8c4dff,
                #d53de8
            );
        }

        .skill-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 14px 30px rgba(91, 65, 180, .15);
            border-color: #c9bbff;
        }

        .skill-info {
            flex: 1;
            min-width: 0;
        }

        .skill-name {
            display: flex;
            align-items: center;
            gap: 11px;
            color: #202744;
            font-size: 19px;
            font-weight: 700;
            line-height: 1.4;
            overflow-wrap: anywhere;
            margin: 0 0 9px;
        }

        .skill-accent {
            display: inline-block;
            flex-shrink: 0;
            width: 5px;
            height: 23px;
            border-radius: 5px;
            background: linear-gradient(180deg, #35b8ff, #b93df1);
        }

        .skill-category {
            color: #7c86a5;
            font-size: 14px;
            line-height: 1.5;
            overflow-wrap: anywhere;
            margin: 0;
        }

        .skill-icon {
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 49px;
            height: 49px;
            color: #fff;
            font-size: 22px;
            border-radius: 15px;
            background: linear-gradient(145deg, #7657ff, #4d20c9);
            box-shadow: 0 9px 18px rgba(91, 48, 208, .28);
        }

        .skills-empty {
            grid-column: 1 / -1;
            padding: 35px;
            text-align: center;
            background: #fff;
            color: #7c86a5;
            border: 1px dashed #d6ccff;
            border-radius: 20px;
        }

        @media (max-width: 1199px) {
            .skills-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 18px;
            }

            .skills-wrapper {
                padding: 22px;
            }

            .skill-card {
                padding: 21px;
            }
        }

        @media (max-width: 576px) {
            .skills-grid {
                grid-template-columns: minmax(0, 1fr);
                gap: 16px;
            }

            .skills-wrapper {
                padding: 15px;
                border-radius: 16px;
            }

            .skills-header {
                align-items: flex-start;
                margin-bottom: 22px;
            }

            .skills-title {
                font-size: 23px;
            }

            .skill-card {
                min-height: 100px;
                padding: 19px;
                border-radius: 18px;
            }

            .skill-name {
                font-size: 17px;
            }

            .skill-icon {
                width: 43px;
                height: 43px;
                font-size: 19px;
                border-radius: 13px;
            }
        }

        /* Respect users who prefer reduced motion */
        @media (prefers-reduced-motion: reduce) {
            .skill-card,
            .skills-add-btn {
                transition: none;
            }

            .skill-card:hover,
            .skills-add-btn:hover {
                transform: none;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <main class="skills-wrapper">

        <!-- Page Header -->
        <div class="skills-header">

            <div>
                <h2 class="skills-title">Skills Directory</h2>

                <p class="skills-subtitle">
                    Explore skills and their associated categories.
                </p>
            </div>

            <a href="add-skill.aspx" class="skills-add-btn">
                <i class="bi bi-plus-lg me-2"></i>
                Add Skill
            </a>

        </div>

        <!-- Skills Cards -->
        <asp:DataList ID="dlskl" runat="server"
            RepeatDirection="Horizontal"
            RepeatLayout="Flow"
            CssClass="skills-grid">

            <ItemTemplate>

                <div class="skill-card">

                    <div class="skill-info">

                        <h5 class="skill-name">

                            <span class="skill-accent"></span>

                            <asp:Label ID="lblSkillName" runat="server"
                                Text='<%# Eval("Skill_Nm") %>' />

                        </h5>

                        <p class="skill-category">

                            <asp:Label ID="lblSkillCategory" runat="server"
                                Text='<%# Eval("Category") %>' />

                        </p>

                    </div>

                    <div class="skill-icon">
                        <i class="bi bi-stars"></i>
                    </div>

                </div>

            </ItemTemplate>

        </asp:DataList>

    </main>

</asp:Content>
