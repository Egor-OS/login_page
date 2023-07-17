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
  "badge": {
    "new": "New",
    "qty": "QTY:",
    "size": "SIZE:"
  },
  "blockTitle": {
    "achieves": "Achieves",
    "activeOrdrs": "Active orders",
    "lastOperat": "Last operations",
    "myAdresses": "My adresses",
    "notifications": "@:duplicate.notifications"
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
    "del": "Delete",
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
    "placeNewOrd": "Place new order",
    "placeOrder": "Place order",
    "push": "Push",
    "remove": "Remove",
    "repeat": "Repeat",
    "save": "Save",
    "send": "Send",
    "showRes": "Show results",
    "sms": "SMS",
    "soon": "Soon",
    "urComplains": "Your complains"
  },
  "duplicate": {
    "allAchieves": "All achieves",
    "banner": {
      "toSpend": "To spend bonuses",
      "selectSome": "select something",
      "dontKnow": "Don't know",
      "howToGet": "how to get bonuses?"
    },
    "bonusBalance": "Bonus balance",
    "catalog": "Catalog",
    "complain": "Complain",
    "date": "Date",
    "email": "E-mail",
    "feedback": "Feedback",
    "newAddress": "New address",
    "notifications": "Notifications",
    "order": "Order"
  },
  "enums": {
    "OrderStatus": {
      "canceled": "Canceled",
      "delivered": "Delivered",
      "waitingForDelivery": "Waiting For Delivery",
      "unknown": "Unknown"
    }
  },
  "navBar": {
    "basket": "Basket",
    "catalog": "@:duplicate.catalog",
    "main": "Main",
    "profile": "Profile"
  },
  "screen": {
    "achieves": {
      "appBar": "@:duplicate.allAchieves",
      "banner": {
        "text": "Find out how to get more achieves by getting bonuses"
      }
    },
    "address": {
      "appBar": {
        "new": "@:duplicate.newAddress",
        "edit": "Edit address"
      },
      "confirmDelMes": "Are you sure you want to delete the address?"
    },
    "bonuses": {
      "appBar": "Bonuses",
      "categories": {
        "speaker": "Speaker at the conference",
        "writer": "Article author"
      },
      "title": "Request bonuses",
      "banner": {
        "first": {
          "title1": "@:duplicate.banner.dontKnow",
          "title2": "@:duplicate.banner.howToGet"
        },
        "second": {
          "title1": "@:duplicate.banner.toSpend",
          "title2": "@:duplicate.banner.selectSome"
        },
        "bSheet": {
          "title1": "Prove yourself",
          "title2": "and get bonuses"
        }
      }
    },
    "cart": {
      "somethingWentWr": "Something went wrong",
      "cartEmpty": {
        "title1": "Your cart",
        "title2": "is empty",
        "text1": "You have ",
        "text2": "bonus points. Spend them on items from the catalog"
      }
    },
    "catalog": {
      "urBalance": "Your balance:"
    },
    "catalog_filter": {
      "appBar": "Catalog filters"
    },
    "checkout": {
      "appBar": "Shipping details"
    },
    "edit_profile": {
      "appBar": "Edit profile",
      "addedAdrMes": {
        "title1": "new address",
        "title2": "has been added",
        "text": "You can place an order to this address"
      }
    },
    "faq": {
      "appBar": "FAQ"
    },
    "feedback": {
      "appBar": "@:duplicate.feedback"
    },
    "login": {
      "welcomMes": "Get bonuses and exchange them for branded products"
    },
    "main": {
      "banner": {
        "text": "You have a lot of bonuses. You can order something for yourself",
        "first": {
          "title1": "To buy something",
          "title2": "you need to get bonuses",
          "text": "@:screen.main.banner.text"
        },
        "second": {
          "title1": "@:duplicate.banner.toSpend",
          "title2": "@:duplicate.banner.selectSome",
          "text": "@:screen.main.banner.text"
        },
        "bonus": {
          "title1": "To get more bonuses, ",
          "title2": "you can do",
          "btn1": "Write an article",
          "btn2": "To speak at the conference"
        }
      },
      "today": "Today:",
      "bonusBalance": "@:duplicate.bonusBalance"
    },
    "notifications": {
      "appBar": "@:duplicate.notifications",
      "tab": {
        "allMessages": "All messages"
      },
      "noNotifMes": {
        "title1": "You have",
        "title2": "no messages"
      }
    },
    "operations": {
      "appBar": "Operations",
      "tab": {
        "all": "All operations",
        "received": "Received bonuses",
        "spent": "Spent bonuses"
      }
    },
    "order": {
      "appBar": "@:duplicate.order",
      "tab": {
        "notDeliv": "Not delivered",
        "wrongPrd": "Wrong product",
        "badPrint": "Bad printing",
        "longDeliv": "Long delivery",
        "poorQlt": "Poor quality"
      }
    },
    "orders": {
      "appBar": "Orders",
      "banner": {
        "text1": "You have ",
        "text2": " bonuses. You can place a new order."
      }
    },
    "phone_confirm": {
      "appBar": "Confirm new phone",
      "title": "Enter the code sent to the new number"
    },
    "profile": {
      "banner": {
        "title1": "@:duplicate.banner.dontKnow",
        "title2": "@:duplicate.banner.howToGet"
      },
      "bonusBalance": "@:duplicate.bonusBalance"
    }
  },
  "snackBarMes": {
    "address": {
      "notRemove": "The removal operation was not completed.",
      "notChenge": "The change operation has not been completed.",
      "notAdd": "Address has not been added.",
      "tryAgain": "Try again..."
    },
    "edit_profile": {
      "succDel": "Address has been successfully deleted",
      "succCh": "Address has been successfully changed"
    },
    "login": {
      "authFiled": "Authorization failed",
      "authSucces": "Authorization was successful"
    },
    "notCompleted": "Sorry, the operation was not completed"
  },
  "textField": {
    "address": "Address",
    "category": "Category",
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
  "validator": {
    "invalidPhone": "Invalid phone number",
    "usedName": "Name already in use"
  }
};
static const Map<String,dynamic> ru = {
  "badge": {
    "new": "New",
    "qty": "QTY:",
    "size": "SIZE:"
  },
  "blockTitle": {
    "achieves": "Achieves",
    "activeOrdrs": "Active orders",
    "lastOperat": "Last operations",
    "myAdresses": "My adresses",
    "notifications": "@:duplicate.notifications"
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
    "del": "Delete",
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
    "placeNewOrd": "Place new order",
    "placeOrder": "Place order",
    "push": "Push",
    "remove": "Remove",
    "repeat": "Repeat",
    "save": "Save",
    "send": "Send",
    "showRes": "Show results",
    "sms": "SMS",
    "soon": "Soon",
    "urComplains": "Your complains"
  },
  "duplicate": {
    "allAchieves": "All achieves",
    "banner": {
      "toSpend": "To spend bonuses",
      "selectSome": "select something",
      "dontKnow": "Don't know",
      "howToGet": "how to get bonuses?"
    },
    "bonusBalance": "Bonus balance",
    "catalog": "Catalog",
    "complain": "Complain",
    "date": "Date",
    "email": "E-mail",
    "feedback": "Feedback",
    "newAddress": "New address",
    "notifications": "Notifications",
    "order": "Order"
  },
  "enums": {
    "OrderStatus": {
      "canceled": "Canceled",
      "delivered": "Delivered",
      "waitingForDelivery": "Waiting For Delivery",
      "unknown": "Unknown"
    }
  },
  "navBar": {
    "basket": "Basket",
    "catalog": "@:duplicate.catalog",
    "main": "Main",
    "profile": "Profile"
  },
  "screen": {
    "achieves": {
      "appBar": "@:duplicate.allAchieves",
      "banner": {
        "text": "Find out how to get more achieves by getting bonuses"
      }
    },
    "address": {
      "appBar": {
        "new": "@:duplicate.newAddress",
        "edit": "Edit address"
      },
      "confirmDelMes": "Are you sure you want to delete the address?"
    },
    "bonuses": {
      "appBar": "Bonuses",
      "categories": {
        "speaker": "Speaker at the conference",
        "writer": "Article author"
      },
      "title": "Request bonuses",
      "banner": {
        "first": {
          "title1": "@:duplicate.banner.dontKnow",
          "title2": "@:duplicate.banner.howToGet"
        },
        "second": {
          "title1": "@:duplicate.banner.toSpend",
          "title2": "@:duplicate.banner.selectSome"
        },
        "bSheet": {
          "title1": "Prove yourself",
          "title2": "and get bonuses"
        }
      }
    },
    "cart": {
      "somethingWentWr": "Something went wrong",
      "cartEmpty": {
        "title1": "Your cart",
        "title2": "is empty",
        "text1": "You have ",
        "text2": "bonus points. Spend them on items from the catalog"
      }
    },
    "catalog": {
      "urBalance": "Your balance:"
    },
    "catalog_filter": {
      "appBar": "Catalog filters"
    },
    "checkout": {
      "appBar": "Shipping details"
    },
    "edit_profile": {
      "appBar": "Edit profile",
      "addedAdrMes": {
        "title1": "new address",
        "title2": "has been added",
        "text": "You can place an order to this address"
      }
    },
    "faq": {
      "appBar": "FAQ"
    },
    "feedback": {
      "appBar": "@:duplicate.feedback"
    },
    "login": {
      "welcomMes": "Get bonuses and exchange them for branded products"
    },
    "main": {
      "banner": {
        "text": "You have a lot of bonuses. You can order something for yourself",
        "first": {
          "title1": "To buy something",
          "title2": "you need to get bonuses",
          "text": "@:screen.main.banner.text"
        },
        "second": {
          "title1": "@:duplicate.banner.toSpend",
          "title2": "@:duplicate.banner.selectSome",
          "text": "@:screen.main.banner.text"
        },
        "bonus": {
          "title1": "To get more bonuses, ",
          "title2": "you can do",
          "btn1": "Write an article",
          "btn2": "To speak at the conference"
        }
      },
      "today": "Today:",
      "bonusBalance": "@:duplicate.bonusBalance"
    },
    "notifications": {
      "appBar": "@:duplicate.notifications",
      "tab": {
        "allMessages": "All messages"
      },
      "noNotifMes": {
        "title1": "You have",
        "title2": "no messages"
      }
    },
    "operations": {
      "appBar": "Operations",
      "tab": {
        "all": "All operations",
        "received": "Received bonuses",
        "spent": "Spent bonuses"
      }
    },
    "order": {
      "appBar": "@:duplicate.order",
      "tab": {
        "notDeliv": "Not delivered",
        "wrongPrd": "Wrong product",
        "badPrint": "Bad printing",
        "longDeliv": "Long delivery",
        "poorQlt": "Poor quality"
      }
    },
    "orders": {
      "appBar": "Orders",
      "banner": {
        "text1": "You have ",
        "text2": " bonuses. You can place a new order."
      }
    },
    "phone_confirm": {
      "appBar": "Confirm new phone",
      "title": "Enter the code sent to the new number"
    },
    "profile": {
      "banner": {
        "title1": "@:duplicate.banner.dontKnow",
        "title2": "@:duplicate.banner.howToGet"
      },
      "bonusBalance": "@:duplicate.bonusBalance"
    }
  },
  "snackBarMes": {
    "address": {
      "notRemove": "The removal operation was not completed.",
      "notChenge": "The change operation has not been completed.",
      "notAdd": "Address has not been added.",
      "tryAgain": "Try again..."
    },
    "edit_profile": {
      "succDel": "Address has been successfully deleted",
      "succCh": "Address has been successfully changed"
    },
    "login": {
      "authFiled": "Authorization failed",
      "authSucces": "Authorization was successful"
    },
    "notCompleted": "Sorry, the operation was not completed"
  },
  "textField": {
    "address": "Address",
    "category": "Category",
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
  "validator": {
    "invalidPhone": "Invalid phone number",
    "usedName": "Name already in use"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
