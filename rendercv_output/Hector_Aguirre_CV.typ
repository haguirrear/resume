
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Hector Aguirre"
#let locale-catalog-page-numbering-style = context { "Hector Aguirre - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Mar 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "New Computer Modern"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "New Computer Modern"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "New Computer Modern"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◦"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Hector Aguirre

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Lima, Peru],
  [#box(original-link("mailto:hector.aguirre.arista@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)hector.aguirre.arista\@gmail.com])],
  [#box(original-link("tel:+51-979-277-722")[#fa-icon("phone", size: 0.9em) #h(0.05cm)979 277 722])],
  [#box(original-link("https://linkedin.com/in/haguirrear")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)haguirrear])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Software Engineer with 7 years of experience in software development and over 2 years of experience leading teams of developers across LATAM. I love new challenges and I am an inquisitive individual, always eager to learn new things with exceptional problem-solving skills. I have extensive experience with Golang, Python, Javascript, Typescript, IaC \(Terraform, CDK, SST\), cloud providers \(AWS, GCP\), different types of databases \(SQL, DynamoDB, ElasticSearch\), CI\/CD Pipelines, and test automation.]
)


== Experience


#two-col-entry(
  left-content: [
    #strong[Software Architecth, Golang]

#emph[Globant - Disney \(ABC News\)]
  ],
  right-content: [
    #emph[Mar 2024 – present]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Led a project to implement real-time push notifications for the ABC News Mobile App for the USA 2024 elections, utilizing Golang, AWS \(Lambdas, SQS, SNS\), and Braze.],[Created a new service to adopt the Disney Plus Video Player into all the other Disney brands \(ABC News, ABC, Natgeo\). This service integrated several CMSs and orchestrated the SSAI \(Server-Side Ad Insertion\). It was written in Go and deployed in AWS Using CDK and ECS.],[Created lambdas to gather metrics such as how long it takes to publish a new story and made a custom Grafana dashboard with those.],[Added the ability to replace the Homepage of the OTV \(Owned TV Brands\) of Disney with a \"Breaking News\" or a custom event. This involved creating a new type of object in the CMS, adding an endpoint in our distribution service to serve it and adding support for it in the backend of the ABC News mobile app.],[Rewrote services from Java and Groovity \(Disney’s custom language based on Groovy\) into Golang, deploying them using ECS and CDK.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Tech Lead]

#emph[Crehana]
  ],
  right-content: [
    #emph[Nov 2021 – Mar 2024]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Created a configurable Single Sign-On \(SSO\) implementation with Identity Provider and Service Provider supporting SAML2 and OAuth2 using Python and FastAPI, deployed in Kubernetes.],[Developed an event-based distributed system to synchronize user and admin configurations across three applications using Python, SQS, SNS, Lambdas, and Step Functions.],[Integrated with Moodle LMS using an event-driven architecture to send progress updates and synchronize courses from Crehana, leveraging Python, SQS, SNS, Lambdas, and Step Functions.],[Implemented a content search feature for locating third-party partner content with SSO-powered links and event-driven progress synchronization, utilizing Python, Elasticsearch, SQS, SNS, and Lambdas.],[Developed a public REST API for personalized client integrations using Golang, Docker, and Kubernetes.],[Created several microservices to expose GraphQL APIs for the frontend web client using Python and FastAPI.],[Migrated a custom GraphQL proxy to Apollo Federation for schema aggregation, enhancing API performance and scalability.],[Set up new microservices and projects, including CI\/CD pipelines with automated testing, linting, and deployment using GitLab CI.],[Led a team of five developers, providing constructive feedback and supporting the professional development of each team member.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Backend Engineer]

#emph[Crehana]
  ],
  right-content: [
    #emph[Aug 2021 – Nov 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed an integration with SAP Success Factors \(LMS\) using an event-driven architecture to synchronize courses and progress information. Leveraged Python, AWS Lambda, SQS, SNS, API Gateway, and Terraform for the implementation.],[Designed and implemented GraphQL APIs using Python frameworks including Flask, FastAPI, and Django, enhancing data access and flexibility for applications.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Backend Engineer \(Consultant\)]

#emph[MINSA \(Peru’s Ministry of Health\)]
  ],
  right-content: [
    #emph[June 2021 – Aug 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Contributed to MINSA's \"Teleatiendo\" virtual healthcare app, enabling patients to make medical appointments and doctors to upload prescriptions.],[Implemented a feature allowing doctors to sign medical prescriptions and orders using electronic identity cards.],[Utilized Python, PostgreSQL, and Nginx for backend development.],[Employed Vanilla JavaScript for client-side implementation.],[Built the application using Django \(Python\) and PostgreSQL, deployed on MINSA’s on-premises servers.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Backend Engineer]

#emph[La Positiva - Digital Transformation Lab]
  ],
  right-content: [
    #emph[Mar 2021 – July 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed backend features for the \"Mobility\" mobile app using Django \(Python\) and AWS.],[Implemented a feature for brokers to calculate insurance quotations.],[Automated the process of selling car insurance via the mobile app.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Fullstack Developer \(Consultant\)]

#emph[German Corporation for International Cooperation GmbH \(GIZ\)]
  ],
  right-content: [
    #emph[Dec 2020 – Mar 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Worked with GIZ, a German development agency, on a project to develop a Mobile Training Application about COVID-19 for MINSA \(Peru’s Ministry of Health\).],[Developed and deployed the backend for the application using Python and FastAPI.],[Utilized AWS for deployment with Docker containers, Nginx as a proxy, and PostgreSQL as the database.],[Developed the mobile application using Flutter.],[Implemented synchronization and caching techniques to ensure offline functionality, catering to medical staff in the jungle's native communities.],[Contributed to training and informing medical staff on managing the COVID-19 pandemic in native communities.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Backend Developer]

#emph[Simple Peru]
  ],
  right-content: [
    #emph[Dec 2019 – Feb 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Engineered robust REST APIs using Python, Flask, and PostgreSQL for custom Leasing Systems.],[Designed and developed a mobile app for Android and iOS with Flutter, facilitating spot reservations in businesses during the COVID-19 pandemic, improving user safety and business compliance.],[Led the deployment and architectural design of backend solutions, ensuring scalability and performance.],[Implemented Docker and AWS cloud services for seamless deployment and efficient infrastructure management.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Trainee Supplier Development Engineer]

#emph[American Glass Products \(AGP\)]
  ],
  right-content: [
    #emph[Feb 2019 – July 2019]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Worked at AGP, a leading manufacturer of laminated glass for top automotive companies including Tesla, McLaren, Volkswagen, and BMW.],[Leveraged Business Intelligence skills using Power BI to provide actionable insights and drive data-informed decisions.],[Developed and implemented automation apps using Microsoft Power Apps and Flow, streamlining and optimizing internal processes for increased productivity and efficiency.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Trainee in the Experimental Economics Laboratory]

#emph[Pontifical Catholic University of Peru \(PUCP\)]
  ],
  right-content: [
    #emph[Apr 2018 – Dec 2018]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Worked at the Experimental Economics Laboratory \(LEEX\), conducting experiments on decision-making research.],[Programmed experimental games using Python, facilitating data collection and analysis.],[Gained experience in managing web pages and servers using Amazon Web Services \(AWS\), ensuring reliable and scalable experiment deployment.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Trainee Developer]

#emph[Novatronic]
  ],
  right-content: [
    #emph[Jan 2017 – July 2017]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed programs for managing financial transactions using C.],[Develop a native Windows app using C\#, and SQL to manage financial transactions.],)
  ],
)



== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Pontifical Catholic University of Peru \(PUCP\)]

#emph[Bachelor in Mechatronics Engineer]
  ],
  right-content: [
    #emph[Peru]

#emph[Mar 2013 – Dec 2018]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Universität Duisburg-Essen]

#emph[Exchange Program in Elektrotechnik und Informationstechnik]
  ],
  right-content: [
    #emph[Germany]

#emph[June 2017 – Mar 2018]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Skills


#one-col-entry(
  content: [- #strong[Go:] Web Apps and CLI utilities],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Python:] REST and GraphQL APIs \(Flask, FastAPI, Django\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Javascript\/Typescript:] Rest APIs using Nodejs and frontend development using React and Solid],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[C:] APIs and embedded systems ],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Dart:] Mobile apps with Flutter],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Terraform:] Deploy services using IaC],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[SQL:] PostgreSQL, MySQL],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Docker:] Deployment of containerized apps],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[AWS:] Design architecture using ECR, ECS, EC2, SQS, SNS, Lambdas, Step Functions, Api Gateways, etc],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[ElasticSearch:] Indexing content and making custom search features],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Redis:] Cache and session management],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Gitlab CI:] Linting, testing, and deployments],
)


== Languages


#one-col-entry(
  content: [- #strong[English]: Advanced],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Spanish]: Native Speaker],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[German]: Intermediate],
)


== Awards


#two-col-entry(
  left-content: [
    #strong[1st place on the 5th Hackathon organized by the National Sociaty of Mining, Oil and Energy \(Peru\)]
  ],
  right-content: [
    #emph[June 2019]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Distributed system for real-time air quality monitoring and early warnings for critical events.],)
  ],
)



