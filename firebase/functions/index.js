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

      // Calculate the average rating with 1 digit after comma
      const averageRating = Math.round((totalRating / reviewCount) * 10) / 10;

      // Update the specialist document with the average rating
      const specialistRef = firestore
          .collection("specialists")
          .doc(specialistId);

      return specialistRef.update({
        rating: averageRating,
        reviewCount: reviewCount,
      });
    });

exports.updateSpecialistFilter = functions.firestore
    .document("specialists/{specialistId}")
    .onWrite(async (change, context) => {
      const specialistsSnapshot = await firestore
          .collection("specialists").get();

      const prices = specialistsSnapshot.docs.map(
          (specialist) => specialist.data().price,
      );

      const minPrice = Math.min(...prices);
      const maxPrice = Math.max(...prices);

      const uniqueSpecializations = new Set();

      specialistsSnapshot.forEach((specialist) => {
        const specializationsArray = specialist.data().specializations;
        specializationsArray.forEach((specialization) => {
          uniqueSpecializations.add(specialization);
        });
      });

      const specializations = Array.from(uniqueSpecializations);

      return firestore
          .collection("filter")
          .doc("specialist_filter")
          .update({
            minPrice: minPrice,
            maxPrice: maxPrice,
            specializations: specializations,
          });
    });
