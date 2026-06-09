---
title: "Workshop Guide"
date: 2024-01-01
showDate: false
showReadingTime: false
showAuthor: false
showTableOfContents: true
---

> **You are reading this guide on your own website.** That's the point. By the end of this workshop, this page will be yours — and you'll replace it (or delete it) with your own content.

---

## Before the Workshop

Make sure you have done the following **before you arrive**. If something doesn't work, come early and we'll sort it out.

### Accounts to create
1. [GitHub](https://github.com) — where your website's code lives
2. [Netlify](https://netlify.com) — where your website gets published
3. [OpenRouter](https://openrouter.ai) — gives you free access to AI models for KiloCode
   - After signing up, go to **Keys** → **Create Key** → copy and save it somewhere safe

### Software to install
1. [VSCodium](https://vscodium.com) — your code editor (free, open-source version of VS Code)
2. [Hugo](https://gohugo.io/installation/) — the tool that builds your site. Follow the instructions for your operating system on that page.
3. [Git](https://git-scm.com/downloads) — version control. Follow the instructions for your operating system.
4. [GitHub Desktop](https://desktop.github.com) — a visual interface for Git. After installing, sign in with your GitHub account.
5. **KiloCode** — install via VSCodium: open VSCodium → Extensions icon (left sidebar) → search "Kilo Code" → Install

### Connect KiloCode to OpenRouter
1. Open VSCodium and click the KiloCode icon in the left sidebar (it looks like a robot)
2. Click the settings gear → select **OpenRouter** as your provider
3. Paste the API key you saved earlier
4. Select a free model from the dropdown (any model labelled "free" will work)

### Readiness check — do this before the workshop

**How to open a terminal:**
- **Mac**: press `Cmd + Space`, type "Terminal", press Enter
- **Windows**: press the Windows key, type "PowerShell", press Enter

Go through each item below. If any of them fail, try to solve it a bit before coming to our meetup (e.g. use a search engine or ask UvA AI Chat).

| Check | How to test |
|---|---|
| VSCodium opens | Launch it — you should see the editor |
| Hugo is installed | Open a terminal and type `hugo version` — you should see a version number |
| Git is installed | Open a terminal and type `git --version` — you should see a version number |
| GitHub Desktop opens | Launch it — you should be logged in to your GitHub account |
| KiloCode is ready | Open VSCodium → click the robot icon → you should see a chat box and your model selected |


---

## Step 1 — Clone This Template

You are going to make a copy of this website and make it your own.

1. Open [this repository on GitHub](#) *(your instructor will give you the URL)*
2. Click the green **Fork** button (top right) — this creates your own copy
3. Open **GitHub Desktop** → File → Clone Repository → find your fork → Clone
4. Open the cloned folder in VSCodium: File → Open Folder

You now have this entire website on your computer.

---

## Step 2 — Preview It Locally

Before changing anything, let's make sure it builds.

1. In VSCodium, open the **Terminal**: View → Terminal (or `` Ctrl+` ``)
2. Run:
   ```
   hugo server
   ```
3. Open your browser and go to `http://localhost:1313`

You should see this website. Every time you save a file, the browser will refresh automatically.

---

## Step 3 — Deploy to Netlify (Get a Live URL)

Do this *before* customising — it's motivating to see your site live.

1. Push your fork to GitHub (it may already be there — check GitHub Desktop)
2. Go to [netlify.com](https://netlify.com) → Log in → **Add new site** → **Import an existing project**
3. Connect GitHub and select your repository
4. Build settings are already configured in `netlify.toml` — just click **Deploy site**
5. Netlify will give you a URL like `random-name-123.netlify.app`

From now on, every time you push a commit, your site updates automatically. Magic.

---

## Step 4 — Meet KiloCode (Vibe Coding)

KiloCode is an AI assistant that lives inside your editor. You talk to it in plain language, it writes or edits code for you, and you decide whether to accept the changes.

**The key principles:**
- **You are in charge.** KiloCode proposes; you decide.
- **Read before accepting.** Don't click "Accept" without understanding what changed.
- **Be specific.** "Change my bio" is worse than "Replace the bio text in `content/about.md` with the following..."
- **Test after every change.** Save the file, check the browser preview, then commit.

**Try it now:** Open KiloCode (robot icon) and type:
> "In the file `content/about.md`, replace the name 'Dr. Reginald Huffington-Smythe III' with my own name throughout."

---

## Step 5 — Customise Your Site

Work through these in order. Use KiloCode to help, but also try editing files directly in VSCodium — it's good to see what's happening under the hood.

### Your identity
Edit `config/_default/languages.en.toml`:
- Change `title` to your name
- Change `description` to something about you
- Update `params.author` — name, email, headline, bio, links

### Your homepage
Edit `content/_index.md` — this is the text on your homepage.

### Your about page
Edit `content/about.md` — bio, education, interests. Delete anything that doesn't apply. Add what does.

### Your publications
Edit `content/publications.md` — replace the fake papers with your actual work. Nothing? That's fine — list your MA thesis, a conference paper, or remove the section entirely.

### Your research
Edit `content/research.md` — describe what you work on.

### Delete this guide
When you're done, either:
- Delete `content/guide.md` and remove it from `config/_default/menus.en.toml`
- Or repurpose it as a page of your own

---

## Step 6 — Commit and Push

1. Open **GitHub Desktop**
2. You'll see your changed files listed
3. Write a short message in the **Summary** box (e.g., "Update bio and homepage")
4. Click **Commit to main**
5. Click **Push origin**

Within a minute, your changes will be live on Netlify.

---

## Going Further

Things you can explore after the workshop:

- **Custom domain**: Buy a domain (e.g., from [Namecheap](https://namecheap.com)) and connect it to Netlify under Site settings → Domain management
- **Change the colour scheme**: Edit `colorScheme` in `config/_default/params.toml`. [Available schemes here](https://blowfish.page/docs/getting-started/#colour-schemes).
- **Add a profile photo**: Add an image to `assets/img/` and reference it in `languages.en.toml`
- **Add a CV page**: Create `content/cv.md` and add it to `menus.en.toml`
- **Keep vibe coding**: Ask KiloCode to help you add new sections, change the layout, or style specific elements

---

## Troubleshooting

**`hugo server` gives an error**  
Make sure you're in the right folder (the one with `netlify.toml` in it). In VSCodium terminal, check with `ls` (Mac) or `dir` (Windows).

**Site looks broken locally**  
Try stopping the server (`Ctrl+C`) and running `hugo server` again.

**Netlify build failed**  
Check the deploy log in Netlify. The most common cause is a missing file or a config typo. Copy the error and ask KiloCode to help.

**KiloCode isn't responding**  
Check your OpenRouter API key is entered correctly in KiloCode settings. Free models sometimes hit rate limits — try a different free model.

---

*This workshop was built with Hugo, Blowfish, and an unreasonable number of opinions about static site generators.*
