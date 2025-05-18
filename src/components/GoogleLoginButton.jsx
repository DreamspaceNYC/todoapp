import React from 'react';
import { GoogleOAuthProvider, GoogleLogin } from '@react-oauth/google';
import { firebaseSignInWithToken } from '../firebase';

const GoogleLoginButton = () => {
  const handleSuccess = async (credentialResponse) => {
    const token = credentialResponse.credential;
    try {
      const userCred = await firebaseSignInWithToken(token);
      console.log('[+] Firebase User:', userCred.user);
    } catch (err) {
      console.error('[-] Firebase Sign-In Failed:', err);
    }
  };

  return (
    <GoogleOAuthProvider clientId="162032329268-r78ll7setcvg8s7m3ggt458136lditj2.apps.googleusercontent.com">
      <GoogleLogin
        onSuccess={handleSuccess}
        onError={() => console.log('Google login failed')}
      />
    </GoogleOAuthProvider>
  );
};

export default GoogleLoginButton;
