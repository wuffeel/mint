const functions = require("firebase-functions/v1");
const admin = require("firebase-admin");
admin.initializeApp();

const firestore = admin.firestore();

exports.updateSpecialistRating = functions.firestore
    .document("reviews/{reviewId}")
    .onWrite(async (change, context) => {
      const after = change.after;
      const reviewData = after.exists ? after.data() : change.before.data();
      const specialistId = reviewData.specialistId;

      // Get all reviews for the specialist
      const reviewsSnapshot = await firestore
          .collection("reviews")
          .where("specialistId", "==", specialistId)
          .get();

      let totalRating = 0;
      let reviewCount = 0;

      // Calculate the total rating and review count
      reviewsSnapshot.forEach((review) => {
        totalRating += review.data().rating;
        reviewCount++;
      });

      // Calculate the average rating
      const averageRating = totalRating / reviewCount;

      // Update the specialist document with the average rating
      const specialistRef = firestore
          .collection("specialists")
          .doc(specialistId);

      return specialistRef.update({
        rating: averageRating,
        reviewCount: reviewCount,
      });
    });
