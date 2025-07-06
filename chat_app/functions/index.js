import { initializeApp } from 'firebase-admin/app';
import { getMessaging } from 'firebase-admin/messaging';
import * as functions from 'firebase-functions/v2/firestore';

initializeApp();

export const myFunction = functions.onDocumentCreated('chat/{messageId}', (event) => {
  const snapshot = event.data;

  if (!snapshot) {
    console.log('No data found in snapshot.');
    return;
  }

  const data = snapshot.data();
  const username = data.username || 'Nova mensagem';
  const text = data.text || '';

  return getMessaging().send({
    notification: {
      title: username,
      body: text,
    },
    data: {
      click_action: 'FLUTTER_NOTIFICATION_CLICK',
    },
    topic: 'chat',
  });
});
