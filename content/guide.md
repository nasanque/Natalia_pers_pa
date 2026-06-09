---
title: "Workshop Guide"
date: 2024-01-01
showDate: false
showReadingTime: false
showAuthor: false
showTableOfContents: true
---

> Welcome to the tutorial! By the end of this tutorial, this webpage will be yours! Yay!

---

## Before the Workshop

Make sure you have done the following **before you arrive**. If something doesn't work, come early and we'll sort it out.

### Planning what you want your page to look like
1. Find 1-2 webpages of scholars that you like. Consider: What info do they give about themselves? How do they list their publications, interests, etc?

### Accounts to create
1. [GitHub](https://github.com) — where your website's code lives
2. [Netlify](https://netlify.com) — where your website gets published
3. [KiloCode](https://kilo.ai/) - gives you access to agentic AI coding (for free)

### Software to install

Attention: if you're on a MacBook, I suggest first installing [Homebrew](https://brew.sh/) and then using it to install these things.

1. [VSCodium](https://vscodium.com) — your code editor (free, open-source version of VS Code)
2. [Hugo](https://gohugo.io/installation/) — the tool that will "build" your site. Follow the instructions for your operating system on that page. (Once again, if Mac use the homebrew instructions!)
3. [Git](https://git-scm.com/downloads) — version control. Follow the instructions for your operating system.
4. [GitHub Desktop](https://desktop.github.com) — a visual interface for Git. After installing, sign in with your GitHub account.
5. **KiloCode** — First, open VSCodium: open VSCodium. Then click the Extensions icon (left sidebar, looks like four squares forming a bigger square) → search "Kilo Code" → Install

### Readiness check — do this before the workshop

Go through each item below. If any of them fail, try to solve it a bit before coming to our meetup (e.g. use a search engine or ask UvA AI Chat).

| Check | How to test |
|---|---|
| VSCodium opens | Launch it — you should see the editor |
| GitHub Desktop opens | Launch it — you should be logged in to your GitHub account |
| KiloCode is ready | Open VSCodium → click the robot icon → you should see a chat box and your model selected |

**Then, using the terminal:**
- **Mac**: press `Cmd + Space`, type "Terminal", press Enter
- **Windows**: press the Windows key, type "PowerShell", press Enter

| Check | How to test |
|---|---|
| Hugo is installed | Open a terminal and type `hugo version` — you should see a version number |
| Git is installed | Open a terminal and type `git --version` — you should see a version number |

If all is good, you're ready for the workshop! Yay!

---

# Wait to go through the below when we're together!

## Step 1 — Clone This Template

You are going to make a copy of this website and make it your own.

For this, we'll use **GitHub** — a website where code lives online. Think of it as a kind of Google Drive for code: your project's files (a bundle of files like this is called a *repository*, or "repo" for short) are stored there, other people can see and reuse them, and it's also where your finished website's code will be hosted.

We'll start the way most coding projects do: by **forking**. Forking simply means making your own personal copy of someone else's repo. You'll fork *my* template into your own GitHub account, so you can change everything freely without ever touching the original.

1. Open [this repository on GitHub](https://github.com/gabrielopereira/PhDPersonalPageTutorial)
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

Do this *before* customising — it's motivating to see your site live before doing anything else.

1. Because you *forked* the template in Step 1 (made your own copy on GitHub), your site's code is already on GitHub — there's nothing to upload yet. Just open GitHub Desktop and confirm your repository is there.
2. Go to [netlify.com](https://netlify.com) → Log in → **Add new site** → **Import an existing project**
3. Connect GitHub and select your repository
4. Build settings are already configured in `netlify.toml` — just click **Deploy site**
5. Netlify will give you a URL like `random-name-123.netlify.app`

From now on, every time you push a commit, your site updates automatically. Magic.

---

## Step 4 — Meet KiloCode (Vibe Coding)

KiloCode allows you to do agentic coding. You talk to it in plain language, it writes or edits code for you, and you decide whether to accept the changes. It can use some free models, but of course you can also pay for premium models.

**Some key principles when doing agentic coding:**
- **You are in charge.** KiloCode proposes; you decide.
- **Read before accepting.** Don't click "Accept" without understanding what changed.
- **Be specific.** "Change my bio" is worse than "Replace the bio text in `content/about.md` with the following..."
- **Test after every change.** Save the file, check the browser preview, and only then commit.

**Try it now:** Open KiloCode (robot icon) and type:
> "Replace the background color with purple."

---

## Step 5 — Customise Your Site

Work through these in order. Use KiloCode to help, but also try editing files directly in VSCodium... it's good to see what's happening under the hood.

First, a quick map. These are the files and folders worth knowing — you only really need to touch a handful:

| File or folder | What it's for |
|---|---|
| `content/` | Your pages — `about.md`, `research.md`, `publications.md`, and so on. One file = one page, in plain Markdown. This is where you'll spend most of your time. |
| `config/_default/languages.en.toml` | Your personal details: name, description, bio, email, social links. |
| `config/_default/menus.en.toml` | The links shown across the top menu (their names and order). |
| `config/_default/params.toml` | Site-wide appearance and settings (e.g. the colour scheme, what's shown on the homepage). |
| `config/_default/hugo.toml` | Core site settings. The main thing to change here is `baseURL` — set it to your own site's URL. |
| `assets/img/` | Images live here. Any photo you want to use (like a profile picture) goes in this folder. |

Everything else — `layouts/`, `themes/`, and the various build folders — is the machinery that turns your content into a website. You generally won't need to touch it by hand. But if you ever want to change the layout or styling, that's a perfect job for KiloCode: describe what you want and let it find the right file.

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

**Committing** means saving a snapshot of your changes with a short note describing them. Each commit is a checkpoint in your project's history — so you can always look back at what changed, and undo it if something breaks.

**Pushing** means uploading your commits from your computer up to GitHub. Once they land on GitHub, Netlify notices automatically and rebuilds your live site — which is why your changes appear online a minute later.

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
Make sure you're signed in to KiloCode (robot icon → check your account). Free models sometimes hit rate limits — try a different free model from the dropdown.

---

*This workshop was built with Hugo, Blowfish, and an unreasonable number of opinions about static site generators.*
