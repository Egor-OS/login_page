// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "duplicate": {
    "allAchieves": "All achieves",
    "catalog": "Catalog",
    "notifications": "Notifications",
    "newAddress": "New address",
    "order": "Order",
    "date": "Date",
    "complain": "Complain",
    "feedback": "Feedback",
    "email": "E-mail"
  },
  "button": {
    "addAddress": "Add new address",
    "addToCart": "Add to cart",
    "allAchieves": "@:duplicate.allAchieves",
    "allOrders": "All orders",
    "apply": "Apply",
    "cancel": "Cancel",
    "checkout": "Checkout",
    "close": "Close",
    "complain": "@:duplicate.complain",
    "confirm": "Confirm",
    "delAll": "Delete all",
    "delFromCart": "Delete from cart",
    "edit": "Edit",
    "email": "@:duplicate.email",
    "faq": "F.A.Q",
    "feedback": "@:duplicate.feedback",
    "getBonuses": "Get bonuses",
    "getMoBonuses": "Get more bonuses",
    "goToAllOrdrs": "Go to all orders",
    "goToCatalog": "Go to catalog",
    "howToGetBons": "How to get the bonuses",
    "learnMore": "Learn more",
    "loginGoogle": "Login with Google",
    "logout": "Log out of your account",
    "newAddress": "@:duplicate.newAddress",
    "placeNewOrd": "Place a new order",
    "placeOrder": "Place order",
    "push": "Push",
    "repeat": "Repeat",
    "remove": "Remove",
    "save": "Save",
    "send": "Send",
    "showRes": "Show results",
    "sms": "SMS",
    "soon": "Soon",
    "urComplains": "Your complains"
  },
  "appBar": {
    "allAchieves": "@:duplicate.allAchieves",
    "bonuses": "Bonuses",
    "catalog": "@:duplicate.catalog",
    "catalogFltr": "Catalog filters",
    "confirmPhone": "Confirm new phone",
    "editAddress": "Edit address",
    "editProfile": "Edit profile",
    "faq": "FAQ",
    "feedback": "@:duplicate.feedback",
    "newAddress": "@:duplicate.newAddress",
    "notifications": "@:duplicate.notifications",
    "operations": "Operations",
    "order": "@:duplicate.order",
    "orders": "Orders",
    "shipDetails": "Shipping details"
  },
  "navBar": {
    "basket": "Basket",
    "catalog": "@:duplicate.catalog",
    "main": "Main",
    "profile": "Profile"
  },
  "banner": {
    "duplicate": {
      "toSpend": "To spend bonuses",
      "selectSome": "select something",
      "dontKnow": "Don't know",
      "howToGet": "how to get bonuses?"
    },
    "main": {
      "text": "You have a lot of bonuses. You can order something for yourself",
      "first": {
        "title1": "To buy something",
        "title2": "you need to get bonuses",
        "text": "@:banner.main.text"
      },
      "second": {
        "title1": "@:banner.duplicate.toSpend",
        "title2": "@:banner.duplicate.selectSome",
        "text": "@:banner.main.text"
      },
      "bonus": {
        "title1": "To get more bonuses, ",
        "title2": "you can do",
        "btn1": "Write an article",
        "btn2": "To speak at the conference"
      }
    },
    "bonuses": {
      "first": {
        "title1": "@:banner.duplicate.dontKnow",
        "title2": "@:banner.duplicate.howToGet"
      },
      "second": {
        "title1": "@:banner.duplicate.toSpend",
        "title2": "@:banner.duplicate.selectSome"
      },
      "bSheet": {
        "title1": "Prove yourself",
        "title2": "and get bonuses"
      }
    },
    "profile": {
      "title1": "@:banner.duplicate.dontKnow",
      "title2": "@:banner.duplicate.howToGet"
    },
    "orders": {
      "text1": "You have ",
      "text2": " bonuses. You can place a new order."
    },
    "allAchieves": {
      "text": "Find out how to get more achieves by getting bonuses"
    }
  },
  "tab": {
    "operations": {
      "all": "All operations",
      "received": "Received bonuses",
      "spent": "Spent bonuses"
    },
    "complain": {
      "notDeliv": "Not delivered",
      "wrongPrd": "Wrong product",
      "badPrint": "Bad printing",
      "longDeliv": "Long delivery",
      "poorQlt": "Poor quality"
    },
    "notifications": {
      "allMessages": "All messages"
    }
  },
  "blockTitle": {
    "achieves": "Achieves",
    "activeOrdrs": "Active orders",
    "lastOperat": "Last operations",
    "myAdresses": "My adresses",
    "notifications": "@:duplicate.notifications"
  },
  "snackBarMes": {
    "authSucces": "Authorization was successful",
    "authFiled": "Authorization failed",
    "notCompleted": "Sorry, the operation was not completed"
  },
  "badge": {
    "new": "New",
    "qty": "QTY:",
    "size": "SIZE:"
  },
  "textField": {
    "address": "Address",
    "city": "City",
    "count": "Count",
    "country": "Country",
    "date": "@:duplicate.date",
    "email": "@:duplicate.email",
    "info": "Info",
    "link": "Link",
    "mPhone": "Mobile phone",
    "name": "Name",
    "order": "@:duplicate.order",
    "phone": "Phone",
    "postcode": "Postcode",
    "resource": "Resource",
    "selectCat": "Select category",
    "selectShip": "Select shipping type",
    "selectTopic": "Select topic",
    "surname": "Surname",
    "urComment": "Your comment"
  },
  "bSheetTitle": {
    "category": "Category",
    "complain": "@:duplicate.complain",
    "date": "@:duplicate.date",
    "quantity": "Quantity",
    "shipAdr": "Shipping address",
    "shipType": "Shipping type",
    "size": "Size",
    "topic": "Topic"
  },
  "enums": {
    "OrderStatus": {
      "canceled": "Canceled",
      "delivered": "Delivered",
      "waitingForDelivery": "Waiting For Delivery",
      "unknown": "Unknown"
    }
  },
  "validator": {
    "usedName": "Name already in use",
    "invalidPhone": "Invalid phone number"
  },
  "noNotifMes": {
    "title1": "You have",
    "title2": "no messages"
  },
  "addedAdrMes": {
    "title1": "new address",
    "title2": "has been added",
    "text": "You can place an order to this address"
  },
  "cartEmpty": {
    "title1": "Your cart",
    "title2": "is empty",
    "text1": "You have ",
    "text2": "bonus points. Spend them on items from the catalog"
  },
  "welcomMes": "Get bonuses and exchange them for branded products",
  "today": "Today:",
  "bonusBalance": "Bonus balance",
  "urBalance": "Your balance:",
  "somethingWentWr": "Something went wrong"
};
static const Map<String,dynamic> ru = {
  "duplicate": {
    "allAchieves": "All achieves",
    "catalog": "Catalog",
    "notifications": "Notifications",
    "newAddress": "New address",
    "order": "Order",
    "date": "Date",
    "complain": "Complain",
    "feedback": "Feedback",
    "email": "E-mail"
  },
  "button": {
    "addAddress": "Add new address",
    "addToCart": "Add to cart",
    "allAchieves": "@:duplicate.allAchieves",
    "allOrders": "All orders",
    "apply": "Apply",
    "cancel": "Cancel",
    "checkout": "Checkout",
    "close": "Close",
    "complain": "@:duplicate.complain",
    "confirm": "Confirm",
    "delAll": "Delete all",
    "delFromCart": "Delete from cart",
    "edit": "Edit",
    "email": "@:duplicate.email",
    "faq": "F.A.Q",
    "feedback": "@:duplicate.feedback",
    "getBonuses": "Get bonuses",
    "getMoBonuses": "Get more bonuses",
    "goToAllOrdrs": "Go to all orders",
    "goToCatalog": "Go to catalog",
    "howToGetBons": "How to get the bonuses",
    "learnMore": "Learn more",
    "loginGoogle": "Login with Google",
    "logout": "Log out of your account",
    "newAddress": "@:duplicate.newAddress",
    "placeNewOrd": "Place a new order",
    "placeOrder": "Place order",
    "push": "Push",
    "repeat": "Repeat",
    "remove": "Remove",
    "save": "Save",
    "send": "Send",
    "showRes": "Show results",
    "sms": "SMS",
    "soon": "Soon",
    "urComplains": "Your complains"
  },
  "appBar": {
    "allAchieves": "@:duplicate.allAchieves",
    "bonuses": "Bonuses",
    "catalog": "@:duplicate.catalog",
    "catalogFltr": "Catalog filters",
    "confirmPhone": "Confirm new phone",
    "editAddress": "Edit address",
    "editProfile": "Edit profile",
    "faq": "FAQ",
    "feedback": "@:duplicate.feedback",
    "newAddress": "@:duplicate.newAddress",
    "notifications": "@:duplicate.notifications",
    "operations": "Operations",
    "order": "@:duplicate.order",
    "orders": "Orders",
    "shipDetails": "Shipping details"
  },
  "navBar": {
    "basket": "Basket",
    "catalog": "@:duplicate.catalog",
    "main": "Main",
    "profile": "Profile"
  },
  "banner": {
    "duplicate": {
      "toSpend": "To spend bonuses",
      "selectSome": "select something",
      "dontKnow": "Don't know",
      "howToGet": "how to get bonuses?"
    },
    "main": {
      "text": "You have a lot of bonuses. You can order something for yourself",
      "first": {
        "title1": "To buy something",
        "title2": "you need to get bonuses",
        "text": "@:banner.main.text"
      },
      "second": {
        "title1": "@:banner.duplicate.toSpend",
        "title2": "@:banner.duplicate.selectSome",
        "text": "@:banner.main.text"
      },
      "bonus": {
        "title1": "To get more bonuses, ",
        "title2": "you can do",
        "btn1": "Write an article",
        "btn2": "To speak at the conference"
      }
    },
    "bonuses": {
      "first": {
        "title1": "@:banner.duplicate.dontKnow",
        "title2": "@:banner.duplicate.howToGet"
      },
      "second": {
        "title1": "@:banner.duplicate.toSpend",
        "title2": "@:banner.duplicate.selectSome"
      },
      "bSheet": {
        "title1": "Prove yourself",
        "title2": "and get bonuses"
      }
    },
    "profile": {
      "title1": "@:banner.duplicate.dontKnow",
      "title2": "@:banner.duplicate.howToGet"
    },
    "orders": {
      "text1": "You have ",
      "text2": " bonuses. You can place a new order."
    },
    "allAchieves": {
      "text": "Find out how to get more achieves by getting bonuses"
    }
  },
  "tab": {
    "operations": {
      "all": "All operations",
      "received": "Received bonuses",
      "spent": "Spent bonuses"
    },
    "complain": {
      "notDeliv": "Not delivered",
      "wrongPrd": "Wrong product",
      "badPrint": "Bad printing",
      "longDeliv": "Long delivery",
      "poorQlt": "Poor quality"
    },
    "notifications": {
      "allMessages": "All messages"
    }
  },
  "blockTitle": {
    "achieves": "Achieves",
    "activeOrdrs": "Active orders",
    "lastOperat": "Last operations",
    "myAdresses": "My adresses",
    "notifications": "@:duplicate.notifications"
  },
  "snackBarMes": {
    "authSucces": "Authorization was successful",
    "authFiled": "Authorization failed",
    "notCompleted": "Sorry, the operation was not completed"
  },
  "badge": {
    "new": "New",
    "qty": "QTY:",
    "size": "SIZE:"
  },
  "textField": {
    "address": "Address",
    "city": "City",
    "count": "Count",
    "country": "Country",
    "date": "@:duplicate.date",
    "email": "@:duplicate.email",
    "info": "Info",
    "link": "Link",
    "mPhone": "Mobile phone",
    "name": "Name",
    "order": "@:duplicate.order",
    "phone": "Phone",
    "postcode": "Postcode",
    "resource": "Resource",
    "selectCat": "Select category",
    "selectShip": "Select shipping type",
    "selectTopic": "Select topic",
    "surname": "Surname",
    "urComment": "Your comment"
  },
  "bSheetTitle": {
    "category": "Category",
    "complain": "@:duplicate.complain",
    "date": "@:duplicate.date",
    "quantity": "Quantity",
    "shipAdr": "Shipping address",
    "shipType": "Shipping type",
    "size": "Size",
    "topic": "Topic"
  },
  "enums": {
    "OrderStatus": {
      "canceled": "Canceled",
      "delivered": "Delivered",
      "waitingForDelivery": "Waiting For Delivery",
      "unknown": "Unknown"
    }
  },
  "validator": {
    "usedName": "Name already in use",
    "invalidPhone": "Invalid phone number"
  },
  "noNotifMes": {
    "title1": "You have",
    "title2": "no messages"
  },
  "addedAdrMes": {
    "title1": "new address",
    "title2": "has been added",
    "text": "You can place an order to this address"
  },
  "cartEmpty": {
    "title1": "Your cart",
    "title2": "is empty",
    "text1": "You have ",
    "text2": "bonus points. Spend them on items from the catalog"
  },
  "welcomMes": "Get bonuses and exchange them for branded products",
  "today": "Today:",
  "bonusBalance": "Bonus balance",
  "urBalance": "Your balance:",
  "somethingWentWr": "Something went wrong"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
