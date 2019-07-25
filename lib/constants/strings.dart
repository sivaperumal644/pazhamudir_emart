/* UI Display Text Strings */

class AccountTypes {
  static const String GOD_ADMIN = 'GOD_ADMIN';
  static const String STORE_ADMIN = 'STORE_ADMIN';
  static const String DELIVERY = 'DELIVERY';
}

class OrderStatuses {
  static const String PLACED_BY_CUST = 'PLACED_BY_CUSTOMER';
  static const String RECEIVED_BY_STORE = 'RECEIVED_BY_STORE';
  static const String PICKED_UP = 'PICKED_UP';
  static const String DELIVERED_AND_PAID = 'DELIVERED_AND_PAID';
  static const String CANCELLED_BY_STORE = 'CANCELLED_BY_STORE';
  static const String CANCELLED_BY_CUST = 'CANCELLED_BY_CUSTOMER';
}

const String STRING_PICKED_UP = 'PICKED UP BY STAFF';

const String STRING_PLACED_BY_CUST = 'INCOMING ORDER';

const String STRING_RECEIVED_BY_STORE = 'UNDER PROCESSING';

const String STRING_DELIVERED_AND_PAID = 'PAID AND COMPLETE';

const String STRING_CANCELLED_BY_STORE = 'CANCELLED BY STORE';

const String STRING_CANCELLED_BY_CUST = 'CANCELLED BY CUSTOMER';

class StringResolver {
  static String getTextForOrderStatus(String status) {
    switch (status) {
      case OrderStatuses.CANCELLED_BY_CUST:
        {
          return STRING_CANCELLED_BY_CUST;
        }
      case OrderStatuses.CANCELLED_BY_STORE:
        {
          return STRING_CANCELLED_BY_STORE;
        }
      case OrderStatuses.DELIVERED_AND_PAID:
        {
          return STRING_DELIVERED_AND_PAID;
        }
      case OrderStatuses.PICKED_UP:
        {
          return STRING_PICKED_UP;
        }
      case OrderStatuses.PLACED_BY_CUST:
        {
          return STRING_PLACED_BY_CUST;
        }
      case OrderStatuses.RECEIVED_BY_STORE:
        {
          return STRING_RECEIVED_BY_STORE;
        }
    }
    return 'INVALID_STATUS_PROVIDED';
  }
}
