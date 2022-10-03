import 'package:flutter/foundation.dart';

enum SignUpType { signUp, signIn }

enum SourceType { camera, photoLibrary }

enum APIType {
  login,
  signUp,
  raffle,
  dashboard,
  review,
  raffaleUserList,
  raffleDetail,
  logout,
  sold,
  favouriteList,
  favourite,
  addRaffale,
  currentUser,
  otherUser,
  ticketPriceList,
  listCategoryDropDown,
  checkout,
  getCardList,
  deleteCard,
  addCard,
  updateCard,
  notificationList,
  getAddress,
  addAddress,
  getWalletAmount,
  getWalletHistory,
  addWalletAmount
}

enum URLHost { local, live, staging }

enum ConditionType { newInPackage, lightlyUsed, used }

enum UserType { current, other }

enum RaffleFavourite { favourite, unFavourite }

enum NotificationType { chat, winner, ticketPurchased }
