part of flutter_dmcb_core;

class DmcbLogListPage extends StatelessWidget {
  const DmcbLogListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Logger'),
          bottom: const TabBar(
            labelColor: Colors.blue,
            labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black,
            isScrollable: false,
            indicatorColor: Colors.transparent,
            indicatorWeight: 3,
            tabs: [
              Tab(child: Text("Log")),
              Tab(child: Text("Net")),
            ],
          ),
          elevation: 0,
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              LogWidget(),
              NetWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
