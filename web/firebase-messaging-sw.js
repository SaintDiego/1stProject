importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyAn67GaIJ_OEA31laXwFdHg1pmmNk1k_10",
  authDomain: "firsttest-ffdbd.firebaseapp.com",
  projectId: "firsttest-ffdbd",
  storageBucket: "firsttest-ffdbd.appspot.com",
  messagingSenderId: "502256906180",
  appId: "1:502256906180:web:eb8a6173401cc0de893e91",
  measurementId: "G-VJJJWCDENR"
});

const messaging = firebase.messaging();