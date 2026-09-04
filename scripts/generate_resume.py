import os
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch
from reportlab.lib.colors import HexColor
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, HRFlowable
from reportlab.pdfgen import canvas

class NumberedCanvas(canvas.Canvas):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._saved_page_states = []

    def showPage(self):
        self._saved_page_states.append(dict(self.__dict__))
        self._startPage()

    def save(self):
        num_pages = len(self._saved_page_states)
        for state in self._saved_page_states:
            self.__dict__.update(state)
            super().showPage()
        super().save()

def generate_resume(output_path):
    # Page setup: letter is 612 x 792 pt
    # Printable area: 532 pt width, 728 pt height with margins 40 & 32
    doc = SimpleDocTemplate(
        output_path,
        pagesize=letter,
        leftMargin=40,
        rightMargin=40,
        topMargin=32,
        bottomMargin=32
    )

    PRIMARY = HexColor("#1E3A8A")       # Deep Navy Blue
    ACCENT = HexColor("#2563EB")        # Royal Blue
    TEXT_DARK = HexColor("#0F172A")     # Slate 900
    TEXT_MUTED = HexColor("#475569")    # Slate 600
    DIVIDER = HexColor("#E2E8F0")       # Slate 200
    DIVIDER_DARK = HexColor("#CBD5E1")  # Slate 300

    styles = getSampleStyleSheet()

    name_style = ParagraphStyle(
        'ResumeName',
        parent=styles['Normal'],
        fontName='Helvetica-Bold',
        fontSize=18,
        leading=22,
        textColor=PRIMARY,
        alignment=0,
        spaceAfter=2
    )

    role_style = ParagraphStyle(
        'ResumeRole',
        parent=styles['Normal'],
        fontName='Helvetica-Bold',
        fontSize=10,
        leading=13,
        textColor=ACCENT,
        alignment=0,
        spaceAfter=4
    )

    contact_style = ParagraphStyle(
        'ResumeContact',
        parent=styles['Normal'],
        fontName='Helvetica',
        fontSize=8.2,
        leading=11.5,
        textColor=TEXT_MUTED,
        alignment=0
    )

    section_heading_style = ParagraphStyle(
        'ResumeSectionHeading',
        parent=styles['Normal'],
        fontName='Helvetica-Bold',
        fontSize=10,
        leading=13,
        textColor=PRIMARY,
        spaceBefore=4,
        spaceAfter=2
    )

    body_style = ParagraphStyle(
        'ResumeBody',
        parent=styles['Normal'],
        fontName='Helvetica',
        fontSize=8.2,
        leading=11,
        textColor=TEXT_DARK,
        alignment=4 # Justify
    )

    item_left_style = ParagraphStyle(
        'ItemLeft',
        parent=styles['Normal'],
        fontName='Helvetica-Bold',
        fontSize=8.8,
        leading=11.5,
        textColor=TEXT_DARK
    )

    item_right_style = ParagraphStyle(
        'ItemRight',
        parent=styles['Normal'],
        fontName='Helvetica-Bold',
        fontSize=8.2,
        leading=11.5,
        textColor=TEXT_MUTED,
        alignment=2 # Right aligned
    )

    bullet_style = ParagraphStyle(
        'ResumeBullet',
        parent=styles['Normal'],
        fontName='Helvetica',
        fontSize=8.1,
        leading=10.8,
        textColor=TEXT_DARK,
        leftIndent=10,
        firstLineIndent=-10
    )

    story = []

    # 1. Header
    story.append(Paragraph("ARPIT KUMAR YADAV", name_style))
    story.append(Paragraph("FLUTTER DEVELOPER • CROSS-PLATFORM SPECIALIST", role_style))

    # Contact line 1: Email, Phone, Location
    c1 = (
        f'<font color="#2563EB"><a href="mailto:arpityadav783791@gmail.com">arpityadav783791@gmail.com</a></font>'
        f'  <font color="#94A3B8">|</font>  '
        f'<font color="#2563EB"><a href="tel:+917652086399">+91 7652086399</a></font>'
        f'  <font color="#94A3B8">|</font>  '
        f'<font color="#475569">Jaipur, Rajasthan, India</font>'
    )
    # Contact line 2: Portfolio Website, GitHub, LinkedIn
    c2 = (
        f'<font color="#2563EB"><a href="https://arpityadav783791-cloud.github.io/Personal_Portfolio/">Portfolio: arpityadav783791-cloud.github.io/Personal_Portfolio</a></font>'
        f'  <font color="#94A3B8">|</font>  '
        f'<font color="#2563EB"><a href="https://github.com/arpityadav783791-cloud">github.com/arpityadav783791-cloud</a></font>'
        f'  <font color="#94A3B8">|</font>  '
        f'<font color="#2563EB"><a href="https://www.linkedin.com/in/arpit-yadav-ab41333aa/">linkedin.com/in/arpit-yadav-ab41333aa</a></font>'
    )
    story.append(Paragraph(f"{c1}<br/>{c2}", contact_style))
    story.append(Spacer(1, 4))
    story.append(HRFlowable(width="100%", thickness=0.8, color=DIVIDER_DARK, spaceBefore=2, spaceAfter=4))

    # 2. Professional Summary
    story.append(Paragraph("PROFESSIONAL SUMMARY", section_heading_style))
    summary_text = (
        "Results-driven Flutter Developer with commercial production application experience developing cross-platform "
        "software using Dart, Flutter, and GetX/BLoC. Proven track record building responsive UIs, architecting decoupled modules "
        "using Clean Architecture and MVVM, integrating complex RESTful APIs, and implementing local persistence (Drift/SQLite). "
        "Strong problem solver dedicated to zero-jank 60fps performance and disciplined Git collaboration."
    )
    story.append(Paragraph(summary_text, body_style))
    story.append(Spacer(1, 3))
    story.append(HRFlowable(width="100%", thickness=0.6, color=DIVIDER, spaceBefore=2, spaceAfter=4))

    # 3. Work Experience
    story.append(Paragraph("WORK EXPERIENCE", section_heading_style))
    
    exp_header = Table([
        [
            Paragraph("Flutter Developer — <i>Xavirgin Technologies</i>", item_left_style),
            Paragraph("June 2026 – Present | Jaipur, India", item_right_style)
        ]
    ], colWidths=[330, 202])
    exp_header.setStyle(TableStyle([
        ('VALIGN', (0,0), (-1,-1), 'TOP'),
        ('LEFTPADDING', (0,0), (-1,-1), 0),
        ('RIGHTPADDING', (0,0), (-1,-1), 0),
        ('BOTTOMPADDING', (0,0), (-1,-1), 1),
        ('TOPPADDING', (0,0), (-1,-1), 0),
    ]))
    story.append(exp_header)
    story.append(Spacer(1, 2))

    exp_bullets = [
        "<b>Production Application (FixMyMeeting):</b> Developed and maintained critical enterprise application modules including Marketplace, Auctions, Real-Time Chat, and Push Notifications.",
        "<b>Dynamic UI & Performance:</b> Engineered a highly responsive cross-device UI and dynamic Banner System, significantly improving user interaction and visual conversion rates.",
        "<b>API & Location Services:</b> Implemented robust location-based services and RESTful APIs, guaranteeing a highly scalable and resilient responsive client architecture.",
        "<b>Bug Elimination & Optimization:</b> Executed comprehensive profiling and bug fixing, resolving edge-case rendering bottlenecks within an Agile development lifecycle.",
        "<b>Codebase Quality:</b> Facilitated continuous delivery through strict Git workflows, structured Pull Requests, peer code reviews, and modular component design."
    ]
    for b in exp_bullets:
        story.append(Paragraph(f"• {b}", bullet_style))
        story.append(Spacer(1, 1.5))

    story.append(Spacer(1, 2))
    story.append(HRFlowable(width="100%", thickness=0.6, color=DIVIDER, spaceBefore=2, spaceAfter=4))

    # 4. Key Projects
    story.append(Paragraph("KEY PROJECTS", section_heading_style))

    projects = [
        {
            "left": "FixMyMeeting | <i>Production Mobile Application</i>",
            "right": "Flutter • Dart • GetX • REST APIs",
            "bullets": [
                "Architected core commercial modules (Marketplace, Auctions, Live Chat, and Notifications) using Clean Architecture and GetX.",
                "Integrated geolocation mapping services and automated background notification listeners for sub-second user updates."
            ]
        },
        {
            "left": 'TrackMate | <font color="#2563EB"><a href="https://github.com/RishabhHatlunkar/trackmate">GitHub Repository</a></font>',
            "right": "Flutter • BLoC • Drift (SQLite) • FL Chart",
            "bullets": [
                "Built an offline-first scheduled activity and habit tracker utilizing BLoC state management and typed Drift (SQLite) persistence.",
                "Engineered interactive visual analytics and trend metrics using FL Chart, integrated with custom Table Calendar timeline scheduling."
            ]
        },
        {
            "left": 'Tesla News Application | <font color="#2563EB"><a href="https://github.com/arpityadav783791-cloud/tesla-news-application">GitHub Repository</a></font>',
            "right": "Flutter • REST APIs • Clean Architecture",
            "bullets": [
                "Developed a customized real-time news aggregator consuming live News REST APIs with advanced search and debounced keyword filtering.",
                "Implemented Clean Architecture separating network repositories from presentation, enabling effortless responsiveness across screen sizes."
            ]
        },
        {
            "left": 'Engineering Cricket Game | <font color="#2563EB"><a href="https://github.com/arpityadav783791-cloud/Engineering_cricket_game">GitHub Repository</a></font>',
            "right": "Flutter • Custom Logic • Fluid Animations",
            "bullets": [
                "Designed and programmed an interactive finger-cricket game characterized by custom game logic and fluid custom animations.",
                "Applied reliable state management solutions to sustain consistent 60fps frame rates and game state persistence."
            ]
        },
        {
            "left": 'Weather Application | <font color="#2563EB"><a href="https://github.com/arpityadav783791-cloud/weather_application">GitHub Repository</a></font>',
            "right": "Flutter • GetX • Weather REST API",
            "bullets": [
                "Built high-utility weather tracker consuming live Weather APIs for real-time forecasts, utilizing GetX for state management."
            ]
        }
    ]

    for p in projects:
        t = Table([
            [
                Paragraph(p["left"], item_left_style),
                Paragraph(p["right"], item_right_style)
            ]
        ], colWidths=[310, 222])
        t.setStyle(TableStyle([
            ('VALIGN', (0,0), (-1,-1), 'TOP'),
            ('LEFTPADDING', (0,0), (-1,-1), 0),
            ('RIGHTPADDING', (0,0), (-1,-1), 0),
            ('BOTTOMPADDING', (0,0), (-1,-1), 1),
            ('TOPPADDING', (0,0), (-1,-1), 0),
        ]))
        story.append(t)
        story.append(Spacer(1, 1.5))
        for b in p["bullets"]:
            story.append(Paragraph(f"• {b}", bullet_style))
            story.append(Spacer(1, 1.2))
        story.append(Spacer(1, 1.5))

    story.append(Spacer(1, 1.5))
    story.append(HRFlowable(width="100%", thickness=0.6, color=DIVIDER, spaceBefore=2, spaceAfter=4))

    # 5. Education
    story.append(Paragraph("EDUCATION", section_heading_style))
    edu_table = Table([
        [
            Paragraph("<b>B.Tech in Artificial Intelligence</b>", item_left_style),
            Paragraph("<b>Expected Graduation: 2027</b>", item_right_style)
        ],
        [
            Paragraph("University Engineering Curriculum • Jaipur, Rajasthan", bullet_style),
            Paragraph("<b>CGPA: 8.5 / 10</b>", item_right_style)
        ]
    ], colWidths=[330, 202])
    edu_table.setStyle(TableStyle([
        ('VALIGN', (0,0), (-1,-1), 'TOP'),
        ('LEFTPADDING', (0,0), (-1,-1), 0),
        ('RIGHTPADDING', (0,0), (-1,-1), 0),
        ('BOTTOMPADDING', (0,0), (-1,-1), 1),
        ('TOPPADDING', (0,0), (-1,-1), 0),
    ]))
    story.append(edu_table)
    story.append(Spacer(1, 3))
    story.append(HRFlowable(width="100%", thickness=0.6, color=DIVIDER, spaceBefore=2, spaceAfter=4))

    # 6. Technical Skills
    story.append(Paragraph("TECHNICAL SKILLS", section_heading_style))
    skills = [
        "<b>Languages & Frameworks:</b> Flutter, Dart, Material 3, Flutter Web",
        "<b>Architecture & State:</b> Clean Architecture, MVVM, BLoC & Cubit, GetX, Provider",
        "<b>Backend, APIs & Storage:</b> Drift (SQLite), Firebase (Auth, Firestore), REST APIs, Shared Preferences, JSON",
        "<b>Tools & Workflow:</b> Git, GitHub, Android Studio, VS Code, Postman, CI/CD, Pull Requests",
        "<b>Core Competencies:</b> Production App Delivery, Offline-First Architecture, Responsive UI, Performance Profiling"
    ]
    for s in skills:
        story.append(Paragraph(f"• {s}", bullet_style))
        story.append(Spacer(1, 1.5))

    doc.build(story)

if __name__ == "__main__":
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    targets = [
        os.path.join(base_dir, "Arpit_Kumar_Yadav_Resume.pdf"),
        os.path.join(base_dir, "assets", "resume", "resume.pdf"),
        os.path.join(base_dir, "web", "Arpit_Kumar_Yadav_Resume.pdf"),
        os.path.join(base_dir, "web", "assets", "resume", "resume.pdf"),
        os.path.join(base_dir, "web", "resume.pdf"),
    ]
    for target in targets:
        os.makedirs(os.path.dirname(target), exist_ok=True)
        generate_resume(target)
        print(f"Successfully generated {os.path.relpath(target, base_dir)}")

