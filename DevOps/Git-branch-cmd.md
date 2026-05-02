# 🌿 Git Branch Commands

This document covers the most commonly used Git branch commands with examples.

---

## 📌 1. Create a Branch
```bash
git branch branch_name
```
Creates a new branch but does not switch to it.

**Example:**
```bash
git branch feature-login
```

---

## 🔄 2. Switch to a Branch
```bash
git switch branch_name
```

**Alternative (older command):**
```bash
git checkout branch_name
```

**Example:**
```bash
git switch feature-login
```

---

## 🚀 3. Create and Switch Branch (One Command)
```bash
git switch -c branch_name
```

**Alternative:**
```bash
git checkout -b branch_name
```

**Example:**
```bash
git switch -c feature-dashboard
```

---

## 📋 4. List Branches
### 🔹 Local Branches
```bash
git branch
```

### 🔹 Remote Branches
```bash
git branch -r
```

### 🔹 All Branches (Local + Remote)
```bash
git branch -a
```

---

## ✏️ 5. Rename a Branch
```bash
git branch -m new_name
```

**Example:**
```bash
git branch -m feature-new
```

---

## ❌ 6. Delete a Branch
```bash
git branch -d branch_name
```

**Example:**
```bash
git branch -d feature-login
```

### ⚠️ Force Delete
```bash
git branch -D branch_name
```

---

## 🔗 7. Merge a Branch
```bash
git merge branch_name
```

**Example:**
```bash
git merge feature-login
```

---

## 📡 8. Push Branch to Remote
```bash
git push origin branch_name
```

---

## 📥 9. Pull Changes from Remote Branch
```bash
git pull origin branch_name
```

---

## 🔍 10. Check Current Branch
```bash
git branch --show-current
```

---

## 🧠 Best Practices
- Use `git switch` instead of `checkout` (clear and modern)
- Use meaningful branch names:
  - `feature-login`
  - `bugfix-header`
  - `hotfix-payment`
- Delete branches after merging to keep repository clean
- Always pull latest changes before creating a new branch

---

## 📚 Summary

| Action              | Command                          |
|---------------------|----------------------------------|
| Create Branch       | `git branch name`                |
| Switch Branch       | `git switch name`                |
| Create + Switch     | `git switch -c name`             |
| List Branches       | `git branch`                     |
| Delete Branch       | `git branch -d name`             |
| Merge Branch        | `git merge name`                 |
| Push Branch         | `git push origin name`           |
| Pull Branch         | `git pull origin name`           |

---

✅ This file can be directly uploaded to GitHub as `git-branch-commands.md`




