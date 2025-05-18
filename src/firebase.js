import { initializeApp } from 'firebase/app';
import { getAuth, signInWithCredential, GoogleAuthProvider } from 'firebase/auth';

const firebaseConfig = {
  apiKey: "AIzaSyBH2iqa6_c6_DxGEKe_qgamDkVjOSvjYqQ",
  authDomain: "awesome-c10f8.firebaseapp.com",
  projectId: "awesome-c10f8",
  storageBucket: "awesome-c10f8.firebasestorage.app",
  messagingSenderId: "740167793613",
  appId: "1:740167793613:web:dd224a387845fd37286284"
};

const app = initializeApp(firebaseConfig);

export const auth = getAuth(app);
export const firebaseProvider = new GoogleAuthProvider();
export const firebaseSignInWithToken = async (token) => {
  const credential = GoogleAuthProvider.credential(token);
  return await signInWithCredential(auth, credential);
};
