# KinkEvents

A Ruby on Rails application for managing private group events and real-time chat, built as a demo for FetLife.

## Features
- User authentication with Devise
- Private groups with invite-only access
- Real-time chat via Action Cable
- Event scheduling within groups

## Tech Stack
- Rails 8.0.2
- Ruby 3.3.7
- PostgreSQL 16.8
- Node.js 22.14.0 / Yarn 1.22.22
- esbuild for JS/CSS

## Setup
1. Clone: `git clone https://github.com/your-username/KinkEvents.git`
2. Install: `bundle install && yarn install`
3. DB: `rails db:create db:migrate`
4. Run: `rails server`
5. Launch: `Localhost\3000`

## Status
- Chat: Real-time, private, working
- Invites: Functional
- Styling: Pending