import 'package:flutter/material.dart';

void main () {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}



class _MyappState extends State<Myapp> {

  int _shirtcount = 0;
  int _pencount = 0;
  int _dollcount =0;
  int _pencilscount = 0;
  int _pantcount = 0;
  bool _applydiscount = false;
  double _total = 0.0;

  final double _shirtprice = 60.0;
  final double _penprice = 10.0;
  final double _dollprice = 30.0;
  final double _pencilprice = 3.0;
  final double _pantprice = 40.0;

  void _calculateTotal () {
    _total = _shirtprice * _shirtcount + _penprice * _pencount + _pencilprice * _pencilscount + _dollprice * _dollcount + _pantprice * _pantcount;
    if (_applydiscount) {
      _total*  0.9;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Clothing and Stationary Bill",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shirts(each\$${_shirtprice})',
                    style: TextStyle(fontSize: 18.0),),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () =>
                            setState(() =>
                            _shirtcount = _shirtcount > 0
                                ? _shirtcount - 1
                                : 0),
                      ),
                      Text('$_shirtcount'),
                      IconButton(icon: Icon(Icons.add),
                          onPressed: () => setState(() => _shirtcount ++)
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pens(each\$${_penprice})',
                    style: TextStyle(fontSize: 18.0),),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () =>
                            setState(() =>
                            _pencount = _pencount > 0 ? _pencount - 1 : 0),
                      ),
                      Text('$_pencount'),
                      IconButton(icon: Icon(Icons.add),
                          onPressed: () => setState(() => _pencount ++)


                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('dolls(each \$${_dollprice})',
                    style: TextStyle(fontSize: 18.0),),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () =>
                            setState(() =>
                            _dollcount = _dollcount > 0
                                ? _dollcount - 1
                                : 0),
                      ),
                      Text('$_dollcount'),
                      IconButton(icon: Icon(Icons.add),
                        onPressed: () => setState(() => _dollcount ++),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pencils(each\$${_pencilscount})',
                    style: TextStyle(fontSize: 18.0),),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () =>
                            setState(() =>
                            _pencilscount = _pencilscount > 0
                                ? _pencilscount - 1
                                : 0),
                      ),
                      Text('$_pencilscount'),
                      IconButton(icon: Icon(Icons.add),
                        onPressed: () => setState(() => _pencilscount ++),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pants(each\$${_pantcount})',
                    style: TextStyle(fontSize: 18.0),),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () =>
                            setState(() =>
                            _pantcount = _pantcount > 0
                                ? _pantcount - 1
                                : 0),
                      ),
                      Text('$_pantcount'),
                      IconButton(icon: Icon(Icons.add),
                        onPressed: () => setState(() => _pantcount ++),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 25.0,),
              Row(
                children: [
                  Checkbox(value: _applydiscount,
                    onChanged: (value) =>
                        setState(() => _applydiscount = value!),
                  ),
                  Text('Apply 10 % discount'),
                ],
              ),
              SizedBox(height: 25.0,),
              ElevatedButton(onPressed: () {
                _calculateTotal();
                setState(() {});
              }, child: Text('Calculate Total'),
              ),
              SizedBox(height: 20.0,),
              Text('Total: \$${_total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
