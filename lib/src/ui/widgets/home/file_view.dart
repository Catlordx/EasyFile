import 'package:flutter/material.dart';

class FileGridView extends StatelessWidget {
  final int itemCount;
  final Function(int) onItemTap;

  const FileGridView({
    super.key,
    required this.itemCount,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const desiredItemWidth = 150.0;
        final crossAxisCount =
            (constraints.maxWidth / desiredItemWidth).floor();
        final finalCount = crossAxisCount.clamp(2, 8);

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: finalCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) => _buildFileItem(index),
        );
      },
    );
  }

  Widget _buildFileItem(int index) {
    return GestureDetector(
      onTap: () => onItemTap(index),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.insert_drive_file, size: 48),
            Text('File $index'),
          ],
        ),
      ),
    );
  }
}

class FileListView extends StatelessWidget {
  final int itemCount;
  final Function(int) onItemTap;

  const FileListView({
    super.key,
    required this.itemCount,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.insert_drive_file),
        title: Text('File $index'),
        subtitle: const Text('Modified: 2024-03-21'),
        onTap: () => onItemTap(index),
      ),
    );
  }
}
