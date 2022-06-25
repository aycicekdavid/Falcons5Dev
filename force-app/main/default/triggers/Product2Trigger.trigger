trigger Product2Trigger on Product2(before insert) {
  for (Product2 p : Trigger.new) {
    p.ProductCode = 'PBS ' + p.ProductCode;
  }

}
