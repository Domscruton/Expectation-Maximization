# Expectation-Maximization-Algorithm

This repository contains an Expectation-Maximization Algorithm that can be used for Semi-Supervised Clustering Problems. Given data and categorization for part of a dataset, one can categorize the remaining data by assuming it belongs to a Mixture Distribution, where each mixture is associated with with a category. This allows for 'overlap' between mixtures and can be extended to multiple dimensions

## 1) Expectation Maximization Report

Report detailing the workings of the Expectation Maximization in one and multiple dimensions. This also includes an application of the algorithm in the Insurance industry, where the Algorithm is used to categorize policyholders based on their parking behaviour to predict the severity and frequence of Away from Home Contents Claims, one of the main high-claim perils in household insurance. Telematics data is collected for a subset of all policyholders, which is then categorized into several groups based on such driving behaviour and given an order based on the level of risk (expected Claims Cost per Year (CCPY)). Given the clustering of policyholders into these Away from Home level of risk groups, the remaining policyholders are classified into the groups that have similar characteristics (e.g. age, Occupation Cluster, Contents Value)

## 2) Expectation-Maximization.R

R code for the one and multi-dimensional Expectation-Maximization Algorithm

## 3) Expectation-Maximization.py

Python code for the one and multi-dimensional Expectation-Maximization Algorithm
