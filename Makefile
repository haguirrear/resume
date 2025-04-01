.PHONY: render_en
render_en:
	uv run rendercv render ./cv_en.yaml -o out/en


.PHONY: render_es
render_es:
	uv run rendercv render ./cv_es.yaml -o out/es

.PHONY: render
render: render_es render_en
