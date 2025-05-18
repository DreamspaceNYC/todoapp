
## Chronolist

![App Screenshot](https://i.ibb.co/TrqT4bx/image.png)

Chronolist is a powerful open-source task manager and to-do list app.
Chronolist captures many of the features users love in modern productivity tools.
## Features

 - Task groups (Projects)
 - Colour coding
 - Task scheduling
 - Board and list views
 - Light and Dark theme!



## Run this project locally


This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

After cloning, run:

### `npm install`


In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

## Deployment

### Prerequisites

Make sure you have the Netlify CLI installed and your Firebase environment variables configured. You can set environment variables locally in a `.env` file or in your Netlify site settings:

```
REACT_APP_API_KEY=<your-api-key>
REACT_APP_AUTH_DOMAIN=<your-auth-domain>
REACT_APP_DATABASE_URL=<your-database-url>
REACT_APP_PROJECT_ID=<your-project-id>
REACT_APP_STORAGE_BUCKET=<your-storage-bucket>
REACT_APP_MESSAGING_SENDER_ID=<your-messaging-sender-id>
REACT_APP_APP_ID=<your-app-id>
```

### Using the environment check script

Run the included script to verify your environment and install dependencies:

```bash
./inspect_env.sh
```

### Deploying with Netlify CLI

```bash
# Log in to your Netlify account
netlify login

# Initialize or link to an existing site
netlify init

# Build for production
npm run build

# Deploy the production build
netlify deploy --prod --dir=build
```

Alternatively, you can connect this repository directly in the Netlify web UI:

1. Go to https://app.netlify.com and add a new site from Git.
2. Select this repository.
3. Set **Build command** to `npm run build` and **Publish directory** to `build`.
4. Add the environment variables listed above in **Site settings > Build & deploy > Environment**.
