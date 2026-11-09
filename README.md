# Frederik Heller’s personal website

Jekyll website at [fheller.dev](https://fheller.dev), using
[Minimal Light](https://github.com/yaoyao-liu/minimal-light).

## Content

- `_pages/about.md`: homepage biography, news, and publications.
- `_bibliography/papers.bib`: the source for publications, including thumbnails, PDF links, project links, and abstracts. Add new papers here; no second publication list to maintain.
- `_news/`: dated announcements and the full IROS 2025 trip write-up.
- `_data/socials.yml`: email, Google Scholar, LinkedIn, and ORCID.
- `_config.yml`: identity, affiliation, domain, and build settings.
- `assets/img/` and `assets/pdf/`: existing photos, publication previews, and PDFs; their paths are preserved.
- `CNAME`: the existing custom domain, `fheller.dev`.

The public routes `/`, `/publications/`, `/news/`, and existing news detail pages
remain available. The project links to TetGraspNets and TacGraspNets still point
to their existing external project sites.

## Add a publication

Append a BibTeX entry to `_bibliography/papers.bib`, using a unique citation key:

```bibtex
@inproceedings{heller2026example,
  title={Your Paper Title},
  author={Heller, Frederik and Doe, Jane},
  booktitle={Conference Name},
  year={2026},
  month={November},
  pdf={https://example.com/paper.pdf},
  html={https://example.com/project},
  preview={your-paper.png},
  abs={Your abstract.}
}
```

For journal papers, use `@article` and `journal` instead of `booktitle`.
Separate authors with `and`. The optional `pdf`, `html` (project page), `url`
(paper page), `preview`, and `abs` fields control the corresponding links,
thumbnail, and expandable abstract. Put thumbnail files in
`assets/img/publication_preview/`. A local PDF goes in `assets/pdf/` and uses
just its filename in the `pdf` field. Omit fields you don't need.

Use `equal_contribution_count={3}` to mark the first three authors with an
asterisk and an equal-contribution note. An `award={Best Student Paper
Award---Finalist}` field highlights the award after the venue; `---` displays
as an em dash.

For accepted papers, `status={Accepted.}` adds an inline note after the venue.

The entry appears on both the homepage and `/publications/`, sorted by year
and month automatically. An optional positive `sortkey` places an entry ahead
of other entries in the same year. `selected` is not needed; all entries are displayed.
Check it in the local preview, then commit and push to publish.

## Preview locally

With Ruby 3.3 and Bundler:

```sh
bundle install
bundle exec jekyll serve
```

Open <http://localhost:4000>. Alternatively, with Docker:

```sh
docker compose up --build
```

Open <http://localhost:8080>. Docker mounts source read-only and writes generated
pages inside the container. Restart the server after changing `_config.yml`.

## Build and publish

```sh
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter
```

The existing `Deploy site` GitHub Actions workflow builds pull requests and
publishes pushes to `main` or `master` to the `gh-pages` branch. The Pages source
should continue to use `gh-pages`. No hosting or custom-domain changes are needed.
The Docker image and native builds use the same committed `Gemfile.lock`.

## Theme and migration

Minimal Light’s dark-mode stylesheet, publication styles, and serif font setup
were copied from upstream commit
`dd114c3fef2d97adc1c6b6d46901e0d96ab83a7c`.
They live in `_sass/minimal-light.scss` and `assets/minimal-light/`; the upstream
CC0 license is in `assets/minimal-light/LICENSE`. Site-specific layout and
accessibility changes are in `_layouts/homepage.html` and
`assets/minimal-light/custom.css`. Automatic dark mode follows the browser’s
color preference. Fonts and social icons use the upstream external providers.

The original al-folio demo posts, sample CV, projects, books, layouts, and assets
are retained in source for recovery. `_config.yml` excludes demo pages and blog
posts from publication and disables the old custom plugins. The previous
al-folio setup remains in Git history. `INSTALL.md`, `CUSTOMIZE.md`, `FAQ.md`,
and scripts under `bin/` describe that previous setup; use the commands above
for this version.

Publication rendering still uses `jekyll-scholar`, with a small Minimal Light
bibliography layout. This preserves the BibTeX source and avoids duplicating
publication metadata in YAML. ImageMagick, notebook conversion, PurgeCSS,
comment systems, and blog-specific plugins are no longer required.
