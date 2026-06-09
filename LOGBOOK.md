# Project Logbook

A running record of decisions, reasoning, and process for the PhD Personal Webpage Workshop project.

---

## Session 1 — 2026-04-03

### Project brief

Gabriel wants to run a 3-hour in-person workshop for ~20 humanities PhD students with no coding experience. The goal: every participant leaves with a live personal academic website they can continue to edit and improve on their own.

### Requirements established

- **Format**: Single 3-hour in-person session; materials should also work as a standalone self-guided resource afterwards
- **Participants**: ~20 humanities PhD students, mixed Windows/Mac laptops, zero assumed coding experience
- **Outcome**: A live website with real content (bio, publications, projects) deployed on the internet
- **Tooling constraint**: Everything must be free and cross-platform
- **Language**: English only
- **Pre-session setup**: Participants install software and create accounts before arriving

---

### Stack decisions

#### Static site generator: Hugo

**Considered**: Hugo, Jekyll  
**Decision**: Hugo  
**Reasoning**: Jekyll requires Ruby, which is notoriously painful to install on Windows (RubyInstaller + DevKit + PATH configuration). With a mixed-laptop audience, this would reliably consume workshop time. Hugo ships as a single binary — install it and it works, on any OS. Local preview is a hard requirement (no skipping it), and Hugo's built-in dev server (`hugo server`) is instant with no dependencies.

#### Theme: Blowfish

**Considered**: PaperMod, Congo, Anatole, Hugo Profile, HugoBlox, Blowfish  
**Decision**: Blowfish  
**Rejected**:
- **HugoBlox** (formerly Academic/Wowchemy): purpose-built for academics and has a one-click Netlify deploy button, but looks too corporate and hides the learning behind automation. Not the right fit.
- **PaperMod**: solid and minimal but not visually distinctive
- **Congo**: nice but more complex to configure
- **Anatole**: good personal feel but limited sections for academic content

**Reasoning for Blowfish**: Beautiful, actively maintained, excellent documentation, good colour scheme options, profile homepage layout works well for a personal academic page.

**Installation method**: git submodule (not Hugo Modules, which requires Go to be installed — an unnecessary extra dependency for students).

#### Hosting: Netlify

**Considered**: Netlify, GitHub Pages  
**Decision**: Netlify  
**Reasoning**: Netlify's Git-based continuous deploy (push → site updates automatically) is a great pedagogical moment. The `netlify.toml` file in the repo pins the Hugo version, which avoids Netlify's notoriously outdated default Hugo version silently breaking builds.

**Critical config**: `netlify.toml` must set `HUGO_VERSION` explicitly. Netlify's default is very old and will break modern themes.

#### Version control UI: GitHub Desktop

**Reasoning**: No terminal required. Essentially identical UI on Mac and Windows. Commit → Push is visible and legible for non-coders.

#### AI coding assistant: KiloCode + OpenRouter

**Considered**: KiloCode with Google AI Studio (Gemini), KiloCode with OpenRouter  
**Decision**: KiloCode + OpenRouter  
**Reasoning**: OpenRouter gives access to multiple free models through a single account and API key, which is simpler than requiring a separate Google account. KiloCode is free, runs in VSCodium, and supports multiple providers. Students can later switch to paid models or their own preferred tools.

**Free model recommendation**: e.g., `google/gemini-flash-1.5` or `meta-llama/llama-3-8b-instruct:free` via OpenRouter.

---

### Workshop structure (3 hours)

| Time | Phase |
|---|---|
| 0:00–0:15 | Intro — what is a static site, what is vibe coding, the plan |
| 0:15–0:30 | Clone the template — open in VSCodium, understand folder structure |
| 0:30–0:50 | Deploy to Netlify — get a live URL before customising (motivating!) |
| 0:50–1:10 | KiloCode intro — how to prompt, how to read output, when to say no |
| 1:10–2:20 | Vibe coding the site — edit bio, publications, research via KiloCode |
| 2:20–2:40 | Commit and push — GitHub Desktop, watch changes go live |
| 2:40–3:00 | Buffer — custom domain, questions, helping stragglers |

---

### Template design decisions

- **Fake academic persona**: Dr. Reginald Huffington-Smythe III, Professor of Postmodern Semiotics at the University of Upper Boroughwick. The persona is deliberately funny and humanities-flavoured so students immediately feel the relevance and are entertained enough to stay engaged. His dog is named Derrida.
- **Workshop guide lives inside the site**: Students read the instructions on their own site, then delete or repurpose that page when done. This is intentionally meta.
- **`CUSTOMIZE_ME.md`**: A plain-language cheat sheet telling students exactly which files to edit and what to change, without requiring them to understand Hugo's full structure.
- **Content sections**: About, Research, Publications, Teaching, Workshop Guide (to be deleted post-workshop)

---

### Validation approach

Following the principle that Claude (and any AI system) performs better when it can verify its own work:

- **`scripts/validate.sh`**: Checks required files exist, runs `hugo --minify`, checks all expected output HTML files are generated, checks build output size is non-trivial. 22 checks total.
- **`Makefile`**: Provides `make serve`, `make build`, `make validate`, `make check` (clean + validate), and `make slides` as simple commands.
- **First validation run**: 22/22 checks passed. All pages return HTTP 200. Build time ~19ms.

---

### Slideshow presentation (`make slides`)

**Decision**: Use `reveal-md` to render `content/guide.md` as a Reveal.js slideshow for live workshop delivery.

**Reasoning**: The workshop guide needed to double as a presentation without duplicating content. `reveal-md` reads `content/guide.md` directly — the same file the Hugo site serves — so edits stay in sync automatically. The `---` horizontal rules already in the guide map naturally to slide breaks. Running `make slides` alongside `make serve` gives both the live site preview and the slideshow from the same source file.

**Implementation**: Single Makefile target added: `npx reveal-md content/guide.md --watch`. No installation step required (`npx` fetches on first run). Slides served at `http://localhost:1948`.

---

### Typography and custom CSS

**Decision**: Keep `assets/css/custom.css` minimal and heavily commented — it is a teaching artefact as much as a config file.

**What it does**:
- Imports a Google Font (Lora) via a single `@import` line students can swap out by changing the font name
- Sets `font-family` on `body` — one line to change the whole site's font
- Sets `font-size` and `line-height` on `article, .prose` — body text size control
- Sets `h1`, `h2`, `h3` sizes explicitly — needed because Blowfish's default heading sizes look disproportionately large once body text is scaled down

**Why heading sizes needed explicit overrides**: Blowfish's theme CSS sets headings at large absolute sizes. When body text is reduced (e.g. to 0.9–1rem), headings remain large and look out of proportion. Explicit `h1/h2/h3` rules in custom.css fix this and give students a clear, editable dial.

**Workshop implication**: The guide/instructions should include a dedicated section on `custom.css` — showing students how to:
1. Browse Google Fonts and copy the import URL
2. Change the `font-family` line
3. Adjust `font-size` if text feels too large or small
4. Tweak heading sizes if needed

This is a good early vibe-coding exercise: "ask KiloCode to change my font to [X] from Google Fonts."

---

### Visual tweaks (Session 1 continued)

- Removed `showRecent` from homepage (was showing recent posts below bio)
- Removed Tags from footer menu
- Disabled `showReadingTime`, `showWordCount` on article pages (cluttered the top of content pages)
- Re-enabled `showTableOfContents` (had been accidentally disabled)
- Bio rewritten in conversational first-person style (inspired by brendanwallace.github.io) — warm, specific, a bit funny, not formal

---

### Open items / next steps

- [ ] First git commit and push to GitHub
- [ ] Test Netlify deployment end-to-end
- [ ] Add `custom.css` section to the workshop guide (`content/guide.md`)
- [ ] Consider adding a GitHub Actions workflow for CI validation on push
- [ ] Pre-session install instructions document
