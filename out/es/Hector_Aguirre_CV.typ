
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Hector Aguirre"
#let locale-catalog-page-numbering-style = context { "Hector Aguirre - Página " + str(here().page()) + " de " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Última actualización Ago 2025"
#let locale-catalog-language = "es"
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
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Lima, Perú],
  [#box(original-link("mailto:hector.aguirre.arista@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)hector.aguirre.arista\@gmail.com])],
  [#box(original-link("tel:+51-979-277-722")[#fa-icon("phone", size: 0.9em) #h(0.05cm)979 277 722])],
  [#box(original-link("https://linkedin.com/in/haguirrear")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)haguirrear])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Ingeniero de Software con más de 7 años de experiencia diseñando e implementando aplicaciones distribuidas en la nube para clientes globales. Con un historial comprobado liderando equipos de desarrolladores en toda Latinoamérica para ofrecer soluciones de alto rendimiento utilizando Golang, Python, IaC \(Terraform, CDK, SST\) y AWS. Apasionado por enfrentar nuevos desafíos, con excelentes habilidades de resolución de problemas y un gran interés en el aprendizaje continuo y la innovación.]
)


== Experience


#two-col-entry(
  left-content: [
    #strong[Arquitecto de Software \(Golang\)]

#emph[Globant - Disney \(ABC News\)]
  ],
  right-content: [
    #emph[Mar 2024 – actualidad]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Lideré un proyecto para implementar notificaciones push en tiempo real para la aplicación móvil ABC News en la cobertura de las elecciones de EE. UU. en 2024, utilizando Golang, AWS \(Lambdas, SQS, SNS\) y Braze.],[Creé un nuevo servicio para adoptar el reproductor de video de Disney Plus en múltiples marcas de Disney \(ABC News, ABC, Natgeo\), integrando varios CMS y orquestando SSAI \(Server-Side Ad Insertion\). Desplegado en AWS con CDK y ECS.],[Desarrollé Lambdas en AWS para recopilar métricas de publicación, reduciendo los tiempos de publicación de historias y habilitando mejoras basadas en datos a través de un panel personalizado en Grafana.],[Implementé un nuevo tipo de objeto en el CMS y un endpoint de API correspondiente para habilitar páginas de inicio de “Noticias de última hora” en las marcas televisivas de Disney, ampliando las capacidades del backend de la aplicación móvil de ABC News.],[Realicé la migración de servicios desde Java\/Groovity \(un lenguaje basado en Groovy personalizado\) a Golang, logrando un mejor rendimiento y mayor facilidad de despliegue en ECS con CDK.],)
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
    #v(design-highlights-top-margin);#highlights([Creé una solución de SSO \(Single Sign-On\) configurable \(SAML2\/OAuth2\) con Python y FastAPI, desplegada en Kubernetes, que permitió la integración segura con servicios de terceros.],[Desarrollé un sistema distribuido impulsado por eventos para sincronizar configuraciones de usuarios\/administradores a través de tres aplicaciones, aprovechando Python, SQS, SNS, Lambdas y Step Functions.],[Integré Crehana con Moodle LMS para automatizar la provisión de cursos y actualizar el progreso de los usuarios utilizando servicios de AWS, mejorando la consistencia de datos y reduciendo esfuerzos manuales.],[Implementé una funcionalidad de búsqueda de contenido \(Python, Elasticsearch, SQS, SNS, Lambdas\) con enlaces protegidos por SSO y seguimiento de progreso impulsado por eventos.],[Creé una API REST pública con Golang, Docker y Kubernetes para integraciones personalizadas con clientes.],[Desarrollé múltiples microservicios que exponen APIs GraphQL mediante Python\/FastAPI, asegurando backends modulares y mantenibles.],[Migré un proxy GraphQL personalizado a Apollo Federation, aumentando el rendimiento y la escalabilidad de la API.],[Establecí pipelines de CI\/CD con GitLab CI para pruebas automatizadas, análisis de código y despliegue, reduciendo los tiempos de lanzamiento y mejorando la calidad.],[Lideré un equipo internacional de cinco desarrolladores, brindando dirección técnica, revisiones de código y mentoría para su crecimiento profesional.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Backend Engineer]

#emph[Crehana]
  ],
  right-content: [
    #emph[Ago 2021 – Nov 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Desarrollé una integración con SAP Success Factors \(LMS\) utilizando una arquitectura impulsada por eventos para sincronizar datos y progreso de cursos \(Python, AWS Lambda, SQS, SNS, API Gateway, Terraform\).],[Diseñé e implementé APIs GraphQL con Python \(Flask, FastAPI, Django\) para ofrecer un acceso más flexible y eficiente a los datos.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Backend Engineer \(Consultor\)]

#emph[MINSA \(Ministerio de Salud de Perú\)]
  ],
  right-content: [
    #emph[Jun 2021 – Ago 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Contribuí a la aplicación de atención virtual “Teleatiendo” de MINSA, permitiendo programar citas y subir recetas médicas de forma segura.],[Implementé la firma digital basada en el Documento Nacional de Identidad para recetas e indicaciones médicas, fortaleciendo la autenticidad de los datos.],[Utilicé Python, PostgreSQL y Nginx para el desarrollo del backend, desplegado en servidores locales.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Backend Engineer]

#emph[La Positiva - Digital Transformation Lab]
  ],
  right-content: [
    #emph[Mar 2021 – Jul 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Desarrollé funcionalidades de backend para la aplicación móvil “Mobility” utilizando Django \(Python\) y AWS.],[Implementé una plataforma usada por brokers para calcular cotizaciones de seguros y automatizar la venta de seguros vehiculares a través de la aplicación móvil.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Desarrollador Fullstack \(Consultor\)]

#emph[German Corporation for International Cooperation GmbH \(GIZ\)]
  ],
  right-content: [
    #emph[Dic 2020 – Mar 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Creé una aplicación móvil de entrenamiento sobre COVID-19 para el MINSA, utilizando Python \(FastAPI\) para el backend y Flutter para el cliente móvil.],[Desplegué aplicaciones contenedorizadas en AWS con Docker, Nginx y PostgreSQL, garantizando la confiabilidad para el personal médico en comunidades remotas de la selva.],[Implementé sincronización y almacenamiento en caché para funcionalidad fuera de línea, aumentando la accesibilidad para usuarios con conectividad limitada.],[Apoyé la capacitación del personal médico en la gestión de la pandemia a través de módulos interactivos de la aplicación.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Desarrollador Backend]

#emph[Simple Peru]
  ],
  right-content: [
    #emph[Dic 2019 – Feb 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Construí APIs REST \(Python, Flask, PostgreSQL\) para sistemas de leasing personalizados, garantizando integraciones escalables y seguras.],[Desarrollé una aplicación móvil en Flutter para gestionar reservas de espacios durante la pandemia de COVID-19, mejorando la seguridad de los usuarios y el cumplimiento normativo de los negocios.],[Implementé Docker y AWS para el despliegue fluido de soluciones de backend.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Trainee Supplier Development Engineer]

#emph[American Glass Products \(AGP\)]
  ],
  right-content: [
    #emph[Feb 2019 – Jul 2019]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Apoyé a un fabricante líder de vidrio laminado para Tesla, McLaren, Volkswagen y BMW mediante la creación de análisis de BI basados en datos con Power BI.],[Desarrollé aplicaciones de automatización con Microsoft Power Apps y Flow, optimizando procesos internos y mejorando la eficiencia.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Practicante en el Laboratorio de Economía Experimental]

#emph[Pontificia Universidad Católica del Perú \(PUCP\)]
  ],
  right-content: [
    #emph[Abr 2018 – Dic 2018]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Programé juegos experimentales en Python para recopilar datos de toma de decisiones en estudios de investigación.],[Administré páginas web y servidores basados en AWS para implementar experimentos de manera confiable y escalable.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Practicante de Desarrollo]

#emph[Novatronic]
  ],
  right-content: [
    #emph[En 2017 – Jul 2017]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Desarrollé programas en C para la gestión de transacciones financieras.],[Creé una aplicación nativa de Windows con C\# y SQL para procesar transacciones.],)
  ],
)



== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Pontificia Universidad Católica del Perú \(PUCP\)]

#emph[Bachiller in Ingeniería Mecatrónica]
  ],
  right-content: [
    #emph[Perú]

#emph[Mar 2013 – Dic 2018]
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

#emph[Programa de Intercambio in Elektrotechnik und Informationstechnik]
  ],
  right-content: [
    #emph[Alemania]

#emph[Jun 2017 – Mar 2018]
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
  content: [- #strong[Go:] Aplicaciones web y utilidades de línea de comando],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Python:] APIs REST y GraphQL \(Flask, FastAPI, Django\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[JavaScript\/TypeScript:] APIs REST usando Node.js, además de desarrollo frontend con React y Solid],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[C:] APIs y sistemas embebidos],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Dart:] Aplicaciones móviles con Flutter],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Terraform:] Despliegue de servicios usando IaC],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[SQL:] PostgreSQL, MySQL],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Docker:] Despliegue de aplicaciones contenedorizadas],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[AWS:] Diseño de arquitectura con ECR, ECS, EC2, SQS, SNS, Lambdas, Step Functions, API Gateways, etc.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Elasticsearch:] Indexación de contenido y creación de funcionalidades de búsqueda personalizadas],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Redis:] Gestión de caché y sesiones],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[GitLab CI:] Análisis, pruebas y despliegues automatizados],
)


== Languages


#one-col-entry(
  content: [- #strong[Inglés]: Avanzado],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Español]: Nativo],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Alemán]: Intermedio],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #strong[Francés]: Básico],
)


== Awards


#two-col-entry(
  left-content: [
    #strong[1er puesto en la 5ta Hackathon organizada por la Sociedad Nacional de Minería, Petróleo y Energía \(Perú\)]
  ],
  right-content: [
    #emph[Jun 2019]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Sistema distribuido para monitoreo de calidad del aire en tiempo real y alertas tempranas para eventos críticos.],)
  ],
)



