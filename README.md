# Hector Aguirre – Software Engineer Resume
This repository hosts my Software Engineer resume. The source of my CV is maintained in a YAML file, and it’s rendered into multiple formats (HTML, PDF, Markdown, TeX, PNG) using the [RenderCV](https://docs.rendercv.com/) tool.


## Usage
1. **Make Edits**
    Update the contents of `cv_en.yaml` or `cv_es.yaml`, adding new experience, refining bullet points, etc.).

2. **Generate All Resume Formats**  
   Run the following command to render your CV in all available formats (HTML, MD, PDF, TeX, and PNG) in the `rendercv_output` folder:
    ```bash
    # After making changes you can just run this command to generate the cv in all formats (html, md, pdf, typ and png)
    make render

    # Under the hood, this invokes
    uv run rendercv render ./cv_en.yaml -o out/en
    ```


Thank you for checking out my resume repository!
