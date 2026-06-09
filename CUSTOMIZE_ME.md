# How to Make This Site Yours

This file is your cheat sheet. Everything you need to change is listed below.

## 1. Your name and identity

File: `config/_default/languages.en.toml`

Change:
- `title` — your full name
- `description` — a one-line description of who you are
- `params.author.name` — your name
- `params.author.email` — your email
- `params.author.headline` — your role / affiliation
- `params.author.bio` — a short bio (2–3 sentences)
- `params.author.links` — your social/contact links

## 2. Your homepage text

File: `content/_index.md`

Replace the placeholder text with your own welcome message.

## 3. Your about page

File: `content/about.md`

Replace the fake bio with your own. Keep the structure or change it — it's just Markdown.

## 4. Your publications

File: `content/publications.md`

Replace the fake papers with your real ones. No publications yet? List your thesis, a conference presentation, or remove sections you don't need.

## 5. Your research

File: `content/research.md`

Describe your actual research projects and interests.

## 6. Your teaching

File: `content/teaching.md`

Add courses you teach or have taught. Not teaching yet? Delete this file and remove it from `config/_default/menus.en.toml`.

## 7. Delete the workshop guide

File: `content/guide.md` and the entry in `config/_default/menus.en.toml`

Once you're done with the workshop, delete this guide page and remove it from the menu.

## 8. Your Netlify URL

File: `config/_default/hugo.toml`

Change `baseURL` to your actual Netlify URL (or custom domain).

File: `netlify.toml`

Change `HUGO_BASEURL` to match.

## 9. Profile photo (optional)

The template ships with a placeholder image (`assets/img/Rooster.png`), referenced by the `image` line under `[params.author]` in `config/_default/languages.en.toml`.

To use your own photo:
1. Put your image in `assets/img/`
2. Update that `image` line to point to your file, e.g. `image = "img/your-photo.jpg"`
