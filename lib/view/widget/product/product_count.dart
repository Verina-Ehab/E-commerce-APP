import 'package:flutter/material.dart';

class ProductCountPrice extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  final String price;
  const ProductCountPrice({
    Key? key,
    this.onAdd,
    this.onRemove,
    required this.count,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ProductControllerImp controller= Get.put(ProductControllerImp());
    return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
                Container(
                  decoration: BoxDecoration(
                    
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(count),
                ),
                IconButton(onPressed:onAdd, icon: const Icon(Icons.add))
              ],
            ),
            const Spacer(),
            Text("$price \$")
          ],
        );
  }
}
