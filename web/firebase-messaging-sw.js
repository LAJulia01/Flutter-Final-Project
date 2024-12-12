// firebase-messaging-sw.js
importScripts('https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/9.17.1/firebase-messaging.js');

firebase.initializeApp({
  apiKey: 'AIzaSyCkpLpyB2YM6Och6fkQEZsbtkjEbOa7AjA',
  authDomain: 'nanny-cares.firebaseapp.com',
  projectId: 'nanny-cares',
  storageBucket: 'nanny-cares.firebasestorage.app',
  messagingSenderId: '943794387340',
  appId: '1:943794387340:web:36409edea26a6d89077ea9',
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  console.log('Received background message ', payload);
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: '/firebase-logo.png'
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});

