# 🏦 Bank Customer Churn Analysis

## Overview

End-to-end churn analysis project on a 10,000-record retail bank dataset. The goal was to figure out *who's leaving, why, and what it's costing the bank* — then back it up with visuals and SQL that actually tell a story. Built as a portfolio project to practice a full analytics workflow: Python for cleaning, SQL for querying, and Power BI for the dashboard.

---

## Context & Problem

Customer churn is one of the most expensive problems a bank can have — losing a customer means losing their entire balance and future revenue, not just a subscription fee. This dataset covers customers across France, Germany, and Spain, with a baseline churn rate of **20.37%** (2,037 out of 10,000 customers exited).

The core questions driving this analysis:

- What does the typical churner look like versus someone who stays?
- Which geography–gender–age combinations are at the highest risk?
- Does owning more bank products actually build loyalty?
- How does account activity interact with balance size to predict churn?
- What's the real dollar impact of churn, broken down by region?

---

## Scope

- 10,000 customer records, 13 original features
- Three European markets: France, Germany, Spain
- Target variable: `Exited` (1 = churned, 0 = retained)
- No missing data — clean dataset, focus was on feature engineering and analysis

---

## Tools

| Layer | Tool |
|---|---|
| Data Cleaning & EDA | Python (pandas) |
| Feature Engineering | Python (pandas) |
| Querying & Analysis | SQL (SQL Server) |
| Visualization | Power BI |
| Notebook | Jupyter |

---

## Skills Demonstrated

- Data cleaning and column standardization in pandas
- Feature engineering (age groups, balance segments, credit tiers, tenure buckets)
- Writing analytical SQL — aggregations, CTEs, conditional logic, window-style groupings
- Translating raw query results into business-readable insights
- Dashboard design in Power BI with slicers and cross-filtering

---

## Key Analysis


**1. Churner vs. Retained Profile**
Churned customers are on average older (45 vs. 37), carry higher balances ($91K vs. $73K), and are far less likely to be active members (26% vs. 49% activity rate).

**2. Highest-Risk Segment**
German females aged 51–60 showed the highest churn concentration. Germany as a whole churns at 32.4% — nearly double France's rate.

**3. Products vs. Loyalty**
Counterintuitively, more products ≠ more loyalty. Customers with 1–2 products churn at 7.6–27.7%, but those with 3–4 products churn at 82.7–100%. Something is going wrong with those bundles.

**4. Activity + Balance**
Inactive customers churn at roughly 2× the rate of active ones across every balance tier. The most at-risk group: inactive customers with high balances — a significant revenue exposure.

**5. Financial Impact by Region**
Germany accounts for ~$98M in lost balances despite having fewer customers than France. France follows at ~$88M. Spain has the lowest exposure at ~$40M.

---

## Dashboard

The Power BI dashboard covers:

- Overall churn KPIs (rate, total churned, balance lost)
- Demographic breakdown by geography, gender, and age group
- Product holding vs. churn rate
- Engagement and balance tier matrix
- Regional financial impact

---

## Key Outcomes

- Identified Germany as the highest-priority retention market by both churn rate and balance loss
- Flagged the 3–4 product bundle as a churn accelerator, not a loyalty driver
- Showed that inactive high-balance customers are the clearest early-warning signal for churn
- Quantified total balance at risk from churned customers: **~$226M across all regions**
- Translated every SQL finding into a concrete business recommendation for the retention team

