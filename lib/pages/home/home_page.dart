import 'package:calculate/pages/porvider/provider_calculate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/flutter_macos_3.29.2-stable.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'nhập số thứ 1',
                            filled: true,
                            fillColor: Colors.grey[300],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final provider = Provider.of<ProviderCalculate>(
                              context,
                              listen: false,
                            );
                            provider.setNumber1(value);
                          },
                        ),
                      ),
                      SizedBox(width: 17),
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'nhập số thứ 2',
                            filled: true,
                            fillColor: Colors.grey[300],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final provider = Provider.of<ProviderCalculate>(
                              context,
                              listen: false,
                            );
                            provider.setNumber2(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        ['+', '-', '*', '/'].map((cal) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                vertical: 17,
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              final provider = Provider.of<ProviderCalculate>(
                                context,
                                listen: false,
                              );
                              provider.calculate(cal);
                            },
                            child: Text(cal, style: TextStyle(fontSize: 20)),
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 36),
                  Consumer<ProviderCalculate>(
                    builder: (context, provider, child) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            provider.result,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 38),
                  Consumer<ProviderCalculate>(
                    builder: (context, provider, child) {
                      if (provider.history.isEmpty) return SizedBox.shrink();

                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(255, 255, 255, 0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.black,
                                ),
                                onPressed: provider.clearHistory,
                              ),
                            ),
                            SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: provider.history.length,
                              itemBuilder: (context, index) {
                                final item = provider.history[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          index == 0
                                              ? Colors.red
                                              : Colors.black,
                                      fontWeight:
                                          index == 1
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
