trigger Product2Trigger on Product2 (before insert) {

List<Product2> pList = new List<Product2>();

for(Product2 p : Trigger.new){
    p.ProductCode = 'PBS ' + p.ProductCode;
    pList.add(p);
}


}