# Circlo

> A social feed app for niche communities to connect and bond through shared content.

---

## Overview

Circlo is a community-first mobile social platform where users join interest-based circles, share posts with media, interact with content through reactions and comments, and discover new communities matching their interests. It focuses on smaller, tighter groups rather than mass broadcasting.

---

## Problem

Mainstream social media platforms are noisy, algorithm-driven, and optimized for engagement over genuine connection. Users seeking community around niche interests — photography, local events, hobbies — struggle to find signal in broadly targeted platforms.

---

## Solution

Circlo organizes users into named circles (topic communities). Feeds are scoped to the circles a user joins, reactions are minimal and intentional, and discovery surfaces circles rather than individual viral content — keeping the focus on community.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | React Native 0.74 (TypeScript) |
| State Management | Zustand |
| Navigation | React Navigation v6 |
| Auth | Firebase Authentication (email + Google) |
| Database | Firebase Firestore |
| Storage | Firebase Cloud Storage |
| Push Notifications | Firebase Cloud Messaging (FCM) |
| Image Handling | react-native-fast-image |
| Media Picker | expo-image-picker |
| Styling | StyleSheet + Reanimated 3 |

---

## Features

**Core**
- Create, join, and leave interest-based circles
- Post text, single images, or multi-image galleries inside a circle
- Reaction bar (6 icons) with live animated counter
- Threaded comments with nested replies
- User profiles with avatar, bio, joined circles, and post history
- Discovery feed showing trending and recently active circles

**Backend & Infrastructure**
- Firebase Auth — persistent sessions, email verification, Google OAuth
- Firestore collections: `/circles`, `/posts`, `/comments`, `/users` — all scoped with security rules
- Firestore real-time listeners on home feed and circle feeds for live post updates without polling
- Firebase Cloud Storage for images with upload progress indicator and thumbnail compression before upload
- FCM push notifications: new comment on your post, circle activity digest, new follower
- Firestore offline persistence enabled for full offline read and in-queue write support
- Security rules enforce: only circle members can write posts; only post authors can delete
- Background FCM token refresh handled transparently

**Social & UX**
- Follow other users and see a personalized activity feed
- Notification center: grouped by circle and type with mark-all-read
- Image lightbox with pinch-to-zoom and swipe-to-dismiss
- Optimistic UI updates for reactions and follows
- Pull-to-refresh on all feeds
- Dark and light theme via system preference

**Offline & Performance**
- Firestore offline cache for viewing previously loaded posts without connectivity
- In-queue writes — posting while offline resolves automatically on reconnect
- Lazy-loaded feed with pagination (cursor-based via Firestore `startAfter`)

---

## Challenges

- Structuring Firestore security rules to allow circle membership checks without multi-document reads on every request
- Managing real-time listener cleanup to prevent memory leaks when navigating between circle feeds
- Handling concurrent reactions efficiently without Firestore write conflicts

---

## Screenshots

_Home Feed · Circle View · Post Detail · Profile_
