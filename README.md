# netflix-data-analysis-sql
# 🎬 Netflix Data Analysis Using SQL

<p align="center">
  <img src="https://img.shields.io/badge/SQL-MySQL-blue?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/Data%20Analysis-Netflix-red?style=for-the-badge" alt="Data Analysis">
  <img src="https://img.shields.io/badge/GitHub-Project-black?style=for-the-badge&logo=github" alt="GitHub">
</p>

<p align="center">
  <b>📊 Exploratory Data Analysis of Netflix Movies & TV Shows using MySQL</b>
</p>

---

## 📌 Project Overview

**Netflix Data Analysis** is a SQL-based data analytics project focused on exploring Netflix Movies and TV Shows using **MySQL**.

The project analyzes Netflix content to discover insights related to:

- 🎬 Movies & TV Shows
- 🌍 Countries
- 🎭 Genres
- ⭐ Ratings
- 🎥 Directors
- 👨‍🎤 Actors
- 📅 Release Years
- ⏱️ Movie Duration
- 📺 TV Show Seasons
- 🔎 Content Descriptions

The main goal of this project is to demonstrate practical **SQL and Data Analysis skills** by answering real-world analytical questions using the Netflix dataset.

---

## 🎯 Project Objectives

This project answers the following analytical questions:

| # | 🔍 Analysis |
|---|---|
| 01 | 🎬 Count Movies vs TV Shows |
| 02 | ⭐ Find the most common ratings |
| 03 | 📅 Find movies released in a specific year |
| 04 | 🌍 Find the top 5 countries with the most content |
| 05 | ⏱️ Identify the longest movie |
| 06 | 📆 Find content added in the last 5 years |
| 07 | 🎥 Find content by a specific director |
| 08 | 📺 Find TV Shows with more than 5 seasons |
| 09 | 🎭 Count content items by genre |
| 10 | 🇮🇳 Analyze Indian Netflix content by year |
| 11 | 📚 Find documentary movies |
| 12 | ❌ Find content without a director |
| 13 | 👨 Find Salman Khan movies from the last 10 years |
| 14 | 🏆 Find the top 10 actors in Indian movies |
| 15 | 🚨 Classify content using description keywords |

---

# 🛠️ Tech Stack

<p align="center">

<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white">

<img src="https://img.shields.io/badge/SQL-000000?style=for-the-badge&logo=sqlite&logoColor=white">

<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white">

</p>

### Tools Used

- 🐬 MySQL
- 💻 MySQL Workbench
- 📊 SQL
- 📁 CSV Dataset
- 🐙 GitHub

---

# 📂 Dataset

The project uses the **Netflix Titles Dataset**, containing information about Movies and TV Shows available on Netflix.

### 📋 Dataset Columns

| Column | Description |
|---|---|
| `show_id` | Unique ID of the content |
| `type` | Movie or TV Show |
| `title` | Title of the content |
| `director` | Director of the content |
| `cast` | Actors appearing in the content |
| `country` | Country associated with the content |
| `date_added` | Date content was added to Netflix |
| `release_year` | Original release year |
| `rating` | Content rating |
| `duration` | Movie duration / TV Show seasons |
| `listed_in` | Genre or category |
| `description` | Description of the content |

---

# 🧠 SQL Concepts Used

This project demonstrates the following SQL concepts:

```text
SELECT
WHERE
GROUP BY
ORDER BY
HAVING
COUNT()
AVG()
CASE WHEN
LIKE
LOWER()
TRIM()
CAST()
SUBSTRING_INDEX()
STR_TO_DATE()
DATE_SUB()
YEAR()
RANK()
LIMIT
SUBQUERIES
WINDOW FUNCTIONS
JSON_TABLE()
STRING MANIPULATION
DATE FUNCTIONS
DATA FILTERING
DATA TRANSFORMATION
