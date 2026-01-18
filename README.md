<p align="center">
  <img src="https://img.shields.io/badge/Vibe%20Coding-Understood-brightgreen?style=for-the-badge&logo=sparkles" alt="Vibe Coding Understood"/>
  <img src="https://img.shields.io/badge/Technical%20Debt-Managed-blue?style=for-the-badge&logo=checkmarx" alt="Technical Debt Managed"/>
  <img src="https://img.shields.io/badge/Claude%20Code-Plugin-purple?style=for-the-badge&logo=anthropic" alt="Claude Code Plugin"/>
</p>

<h1 align="center">Do I Understand It?</h1>

<p align="center">
  <strong>Stop shipping code you don't understand. Start owning every line.</strong>
</p>

<p align="center">
  <a href="#-the-problem">The Problem</a> •
  <a href="#-the-solution">The Solution</a> •
  <a href="#-features">Features</a> •
  <a href="#-installation">Installation</a> •
  <a href="#-usage">Usage</a>
</p>

---

## The Problem

**The future is changing, and so is coding.**

Let's be honest with ourselves. A lot of engineers nowadays rely on AI agents to help them ship features faster. And that's great! But here's the uncomfortable truth:

> *Although you understand the global picture, you probably don't know all the implementation details of the 10 PRs you finished this week.*

You might have already realized this when you were asked to change some features you've worked on in the past few months, and noticed you don't vividly remember all the implementation details... **as if the code was not really yours.**

Sound familiar? You're not alone.

---

## The Solution

Introducing **DoI** (Do I understand it?) — a Claude Code plugin that turns your vibe-coded PRs into learning opportunities.

```
                    ┌──────────────────┐
                    │   Your Branch    │
                    │   with changes   │
                    └────────┬─────────┘
                             │
                             ▼
              ┌──────────────────────────────┐
              │         /doi skill           │
              │  ┌────────────────────────┐  │
              │  │ • Analyzes your diff   │  │
              │  │ • Generates questions  │  │
              │  │ • Tests understanding  │  │
              │  └────────────────────────┘  │
              └──────────────┬───────────────┘
                             │
              ┌──────────────┴───────────────┐
              │                              │
              ▼                              ▼
     ┌─────────────────┐          ┌─────────────────────┐
     │   You Knew It   │          │   Vibe Debt         │
     │       ✓         │          │   (saved for later) │
     │   Ship with     │          │                     │
     │   confidence!   │          │   Run /paydebt      │
     └─────────────────┘          │   when ready        │
                                  └─────────────────────┘
```

### What is Vibe Debt?

Just like technical debt, **Vibe Debt** is the understanding gap that accumulates when you ship code without fully grasping its implementation details.

| Traditional Debt | Vibe Debt |
|------------------|-----------|
| Code that needs refactoring | Code you don't fully understand |
| Shortcuts in implementation | Shortcuts in comprehension |
| Slows down future development | Slows down debugging & maintenance |
| Fixed by refactoring | Fixed by learning (with `/paydebt`) |

---

## Features

### `/doi` — Test Your Understanding

Run `/doi` on any feature branch to generate a personalized quiz about your changes.

```
┌─────────────────────────────────────────────────────────────────────┐
│  Question 3/7:                                                      │
│                                                                     │
│  Why does `processPayment()` write to a local transaction log       │
│  BEFORE calling the payment gateway API?                            │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │ A │ To enable recovery/retry if the API call fails midway,  │    │
│  │   │ ensuring we know what operation was attempted           │    │
│  ├─────────────────────────────────────────────────────────────┤    │
│  │ B │ To make the code run faster by doing I/O in parallel    │    │
│  ├─────────────────────────────────────────────────────────────┤    │
│  │ C │ Because the payment gateway requires a log file path    │    │
│  ├─────────────────────────────────────────────────────────────┤    │
│  │ D │ To satisfy TypeScript's type checker                    │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                                                                     │
│  Type "show me" to reveal answer, "skip" to save as vibe debt       │
└─────────────────────────────────────────────────────────────────────┘
```

**Question types cover:**
- **Why** (25%) — Purpose behind changes
- **How** (35%) — Implementation mechanisms
- **What-if** (20%) — Edge cases and error handling
- **Impact** (20%) — Effects on the codebase

### `/paydebt` — Clear Your Vibe Debt

In a hurry before merging? No problem! Skip the quiz and save it as Vibe Debt.

At the end of your sprint (or whenever you have time), run `/paydebt` to revisit all the questions you skipped:

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                     │
│  === Vibe Debt Session Complete ===                                 │
│                                                                     │
│  This Session:                                                      │
│  ✓ Questions answered correctly: 12                                 │
│  ○ Questions still remaining: 3                                     │
│  ✓ Files cleared: 2                                                 │
│  ○ Files updated: 1                                                 │
│                                                                     │
│  Remaining Vibe Debt:                                               │
│  • Total files: 1                                                   │
│  • Total questions: 3                                               │
│                                                                     │
│  Great progress! You're almost debt-free.                           │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## The Workflow

```
    ┌───────────────────────────────────────────────────────────────────────────────┐
    │                           Your Development Cycle                              │
    └───────────────────────────────────────────────────────────────────────────────┘

         Code with AI          Ready to merge?           End of sprint
              │                      │                        │
              ▼                      ▼                        ▼
    ┌─────────────────┐    ┌─────────────────┐      ┌─────────────────┐
    │                 │    │                 │      │                 │
    │  Vibe code your │───▶│   Run /doi      │      │  Run /paydebt   │
    │  feature branch │    │                 │      │                 │
    │                 │    └────────┬────────┘      └────────┬────────┘
    └─────────────────┘             │                        │
                                    │                        │
                         ┌─────────┴─────────┐              │
                         │                   │              │
                         ▼                   ▼              ▼
                  ┌────────────┐      ┌────────────┐  ┌────────────┐
                  │            │      │            │  │            │
                  │  Answer    │      │   Skip &   │  │  Answer    │
                  │  questions │      │   merge    │  │  saved Qs  │
                  │            │      │            │  │            │
                  └─────┬──────┘      └─────┬──────┘  └─────┬──────┘
                        │                   │               │
                        ▼                   ▼               ▼
                  ┌────────────┐      ┌────────────┐  ┌────────────┐
                  │    Own     │      │   Vibe     │  │   Reduce   │
                  │  your code │      │   Debt++   │  │  Vibe Debt │
                  └────────────┘      └────────────┘  └────────────┘
```

---

## Installation

### Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and configured

### Setup

```bash
# Clone the repository
git clone https://github.com/Ali-Doggaz/RuleYourUsage.git
cd RuleYourUsage
<<<<<<< Updated upstream
chmod +x ./install.sh
./install.sh
=======

# Install dependencies
npm install

# That's it! The skills are ready to use.
>>>>>>> Stashed changes
```

---

## Usage

### Test Your Understanding

```bash
<<<<<<< Updated upstream
claude
# Run questions
> /doi
# pay vibe debt
> /paydebt
=======
# Switch to any feature branch
git checkout my-feature-branch

# Run the comprehension quiz
/doi
>>>>>>> Stashed changes
```

### Pay Off Your Vibe Debt

```bash
# Review skipped questions from past sessions
/paydebt
```

---

## Why This Matters

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                     │
│   "The best time to understand your code was when you wrote it.     │
│    The second best time is now."                                    │
│                                                                     │
│                                         — Ancient Developer Proverb │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

**With AI-assisted coding becoming the norm, the developers who thrive won't just be those who ship the fastest — they'll be those who truly understand what they ship.**

DoI helps you:
- **Build confidence** in code you've written with AI assistance
- **Debug faster** because you actually know how things work
- **Onboard teammates** because you can explain your code
- **Sleep better** knowing your codebase isn't a mystery

---

## Contributing

We'd love your help making DoI even better! Whether it's:
- New core features suggestions to reduce Vibe debt
- New question types
- Better quiz algorithms
- UI improvements
- Bug fixes

Feel free to open an issue or submit a PR.

---

## License

MIT License — see [LICENSE](LICENSE) for details.

---

<p align="center">
  <strong>Stop vibe coding blind. Start understanding what you ship.</strong>
</p>

<p align="center">
  Made with care for developers who want to own their code.
</p>
