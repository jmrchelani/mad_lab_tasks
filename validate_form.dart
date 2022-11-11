class FormValidation extends StatefulWidget {
  FormValidation({Key? key}) : super(key: key);

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  var name = 'Not yet entered';
  var cast = 'Not yet entered';
  var city = 'Not yet entered';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller1,
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: controller2,
                      decoration: InputDecoration(
                        hintText: 'Enter Cast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: controller3,
                      decoration: InputDecoration(
                        hintText: 'Enter City',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your City';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              name = controller1.text;
                              cast = controller2.text;
                              city = controller3.text;
                            });
                          }
                        },
                        child: Text('Show Data')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name:',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          name,
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cast:',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          cast,
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          city,
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
