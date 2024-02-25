import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/page/management/page.dart';

class SimpleBottomAppBar extends StatelessWidget {
  const SimpleBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 72.0,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Builder(
              builder: (context) => _buildBottomAppBarItem(
                context: context,
                icon: Icons.menu,
                label: '場面一覧',
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            _buildBottomAppBarItem(
              context: context,
              icon: Icons.settings,
              label: '管理メニュー',
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ManagementPage()),
                (_) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBarItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24.0),
          const SizedBox(height: 4.0),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
