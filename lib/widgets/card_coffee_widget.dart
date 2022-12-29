import 'package:coffee_api/models/coffee_model.dart';
import 'package:coffee_api/utils/more_text_utils.dart';
import 'package:flutter/material.dart';

class CardCoffeeWidget extends StatefulWidget {
  final CoffeeModel coffee;

  const CardCoffeeWidget(this.coffee, {super.key});

  @override
  State<CardCoffeeWidget> createState() => _CardCoffeeWidgetState();
}

class _CardCoffeeWidgetState extends State<CardCoffeeWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 10),
            title: Text(widget.coffee.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MoreText.truncateString(
                    widget.coffee.description, isExpanded)),
                const SizedBox(
                  height: 8.0,
                ),
                widget.coffee.description.length >= 100
                    ? InkWell(
                        child: Text(
                          isExpanded ? 'Show Less' : 'Show More',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (isExpanded) {
                              isExpanded = false;
                            } else {
                              isExpanded = true;
                            }
                          });
                        },
                      )
                    : Container(),
              ],
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.coffee.image),
            ),
          ),
        ],
      ),
    );
  }
}
