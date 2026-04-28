# 📘 Source Code Management (SCM) & Git Notes

---

## 📌 1. Introduction to SCM Tool

**SCM (Source Code Management)** is a system used to track and manage changes in source code.

### 🔹 Importance of SCM
- Tracks code changes over time
- Enables team collaboration
- Maintains version history
- Helps in rollback (undo changes)
- Supports branching & merging

### 🔹 Popular SCM Tools
- Git
- SVN (Subversion)
- Mercurial

---

## 📌 2. Difference Between Centralized VCS and Distributed VCS

| Feature | Centralized VCS (CVCS) | Distributed VCS (DVCS) |
|--------|------------------------|------------------------|
| Repository | Single central server | Multiple copies (local + remote) |
| Example | SVN | Git |
| Internet Required | Yes | No (for most operations) |
| Speed | Slower | Faster |
| Backup | Risky (single point failure) | Safe (multiple copies) |
| Collaboration | Limited | Advanced |
| Branching | Difficult | Easy & fast |

### 🔹 Summary
- **CVCS** → One central repository
- **DVCS** → Multiple repositories (local + remote)

---

## 📌 3. Introduction to Git

**Git** is a **Distributed Version Control System (DVCS)**.

### 🔹 Features
- Fast and lightweight
- Works offline
- Strong branching & merging
- Distributed architecture
- Open-source

### 🔹 Platforms Using Git
- GitHub
- GitLab
- Bitbucket

---

## 📌 4. Git Lifecycle
Working Directory → Staging Area → Local Repository → Remote Repository


### 🔹 Stages Explanation

1. **Working Directory**
   - Where files are created and modified

2. **Staging Area** 
   - Prepares files before committing

3. **Local Repository**
   - Stores committed changes locally

4. **Remote Repository**
   - Shared repository (GitHub, GitLab)

---

### 🔹 Lifecycle Flow

1. Modify file  
2. Add file → `git add`  
3. Commit → `git commit`  
4. Push → `git push`  

---

## 📌 5. Git CLI Installation

### 🔹 Windows
1. Download Git from official website
2. Install using setup wizard
3. Verify installation:
```bash
git --version



## Mac
brew install git

## Linux
sudo apt install git


6. Git Commands(Local Repository)
🔹 Initialize Repository
git init

## Check Status

git status

## Add Files

git add .

## Commit Changes

git commit -m "Initial commit"

## View Logs

git log
    Displays:
        Commit ID
        Author
        Date
        Message


📌 7. Important Concepts
🔹 Tracked vs Untracked Files
Tracked → Files Git is monitoring
Untracked → New files not yet added
🔹 Staging Area
Intermediate step before commit
Helps control what changes go into commit


📌 8. Quick Command Flow

git init
git status
git add .
git commit -m "message"
git log
git restore file.txt
git revert <commit_id>