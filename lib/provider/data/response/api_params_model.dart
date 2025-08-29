
class ApiParamsModels{

   static  loginParam(String mobileNumber, deviceToken,deviceType){
    return  {
      "mobile_number":mobileNumber,
      "device_token":deviceToken,
      "device_type":deviceType
    };
  }


   static  rechargeParam(String userid, rechargeAmt,paymentId){
     return  {
       "user_id":userid,
       "recharge_amt":rechargeAmt,
       "payment_id":paymentId
     };
   }
   static  getOrderParam(String userId, bookingId){
     return  {
       "user_id":userId,
       "booking_id":bookingId,

     };
   }


   static  homePageParam(String userId ,lat,long,deviceType,deviceToken){
     return  {
       "user_id":userId,
       "from_gps_lat":lat,
       "from_gps_long":long,
       "device_type":deviceType,
       "device_token":deviceToken,
     };
   }


   static  createBookingParam({
     String? userId ,
     String?  fromLat,
     String?  toLat,
     String? fromLong,
     String? toLong,
     String? fromGpsLocation,
     String? toGpsLocation,
     String? type,
     String? tripType,
     String? pickUpdate,
     String? pickupTime,
     String? returnDate,
     String? returnTime,
     String? vehicleTypeId,
     String? baseKm,
     String? baseHrs,
     String? couponCode,
     String? bookedForName,
     String? bookedForMobNumber,
     String? bookedFor,
     String? paymentMode,
}
       ){
     return  {
       "user_id":userId,
       "from_gps_lat":fromLat,
       "from_gps_long":fromLong,
       "to_gps_lat":toLat,
       "to_gps_long":toLong,
       "from_gps_location":fromGpsLocation,
       "to_gps_location":toGpsLocation,
       "type":type,
       "trip_type":tripType,
       "pickup_date":pickUpdate,
       "pickup_time":pickupTime,
       "return_date":returnDate,
       "return_time":returnTime,
       "vehicle_type_id":vehicleTypeId,
       "base_km":baseKm,
       "base_hour":baseHrs,
       "coupan_code":couponCode,
       "booked_for_name":bookedForName,
       "booked_for_mobile_number":bookedForMobNumber,
       "booked_for":bookedFor,
       "payment_mode":paymentMode,
     };
   }

   static  flexyParam(String userId ,fromLat,fromLong,toGpsLat,toGpsLong,pickUpDate,pickupTime,couponCode){
     return  {
       "user_id":userId,
       "from_gps_lat":fromLat,
       "from_gps_long":fromLong,
       "to_gps_lat":toGpsLat,
       "to_gps_long":toGpsLong,
       "type":"Flexy",
       "pickup_date":pickUpDate,
       "pickup_time":pickupTime,
       "coupan_code":couponCode,
     };
   }

   static  rentalParam(String userId ,fromLat,fromLong,toGpsLat,toGpsLong,pickUpDate,pickupTime,couponCode){
     return  {
       "user_id":userId,
       "from_gps_lat":fromLat,
       "from_gps_long":fromLong,
       "to_gps_lat":toGpsLat,
       "to_gps_long":toGpsLong,
       "type":"Rental",
       "pickup_date":pickUpDate,
       "pickup_time":pickupTime,
       "coupan_code":couponCode,
     };
   }

   static  outstationParam(String userId ,fromLat,fromLong,toGpsLat,toGpsLong,pickUpDate,
       pickupTime,tripType,returnDate,returnTime,couponCode){
     return  {
       "user_id":userId,
       "from_gps_lat":fromLat,
       "from_gps_long":fromLong,
       "to_gps_lat":toGpsLat,
       "to_gps_long":toGpsLong,
       "type":"Outstation",
       "trip_type":tripType,
       "pickup_date":pickUpDate,
       "pickup_time":pickupTime,
     'return_date':returnDate,
     'return_time':returnTime,
     "coupan_code":couponCode,
     };
   }

}