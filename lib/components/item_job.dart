import 'package:curso_job_finder_app/models/job.dart';
import 'package:flutter/material.dart';

class ItemJob extends StatefulWidget {

  Job job;
  
  bool themeDark;
  ItemJob(this.job, {this.themeDark = false});

  @override
  _ItemJobState createState() => _ItemJobState();
}

class _ItemJobState extends State<ItemJob> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 20.0, top: 20.0),
      child: Container(
        width: double.infinity,
        decoration: _boxDecoraion(context),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _companyLogo(),
                  _favIcon(),
                  //_recent(context),
                ],
              ),
              _infoJobtexts(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoraion(context) {
    return BoxDecoration(
      color: this.widget.themeDark ? Theme.of(context).primaryColor : Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(4.0, 4.0),
          blurRadius: 10.0
        ),
      ]
    );
  }

  _companyLogo() {
    return Container(      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          this.widget.job.company.urlLogo,
          width: 60.0,
          height: 60.0,
        )
      ),
    );
  }

  Widget _favIcon() {
    return GestureDetector(
      child: Icon(
        this.widget.job.isFavorites ? Icons.favorite : Icons.favorite_border,
        color: this.widget.themeDark ? Colors.white : Colors.grey,
      ),
      onTap: (){
        setState(() {
          this.widget.job.isFavorites = !this.widget.job.isFavorites;
        });
      },
    );
  }

  Widget _infoJobtexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.widget.job.company.name,
          style: TextStyle(
            fontSize: 15.0, 
            color: this.widget.themeDark ? Color(0XFFB7B7D2) : Colors.grey),
        ),
        Text(
          this.widget.job.role,
          style: this.widget.themeDark 
                ?  Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 3.0),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).highlightColor,
              size: 15.0,              
            ),
            SizedBox(width: 5.0,),
            Text(
              this.widget.job.location,
              style: TextStyle(
                fontSize: 15.0,
                color: this.widget.themeDark ? Color(0XFFB7B7D2) : Colors.grey),
              ),
          ],
        )
      ],
    );
  }
}