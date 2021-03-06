# Generated by Django 2.1 on 2020-01-28 11:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('crt', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='toss_decision',
            field=models.PositiveSmallIntegerField(choices=[(0, '----'), (1, 'bat'), (2, 'field')], default=0),
        ),
        migrations.AlterField(
            model_name='match',
            name='win_type',
            field=models.PositiveSmallIntegerField(choices=[(0, '----'), (1, 'by runs'), (2, 'by wickets')], default=0),
        ),
        migrations.AlterField(
            model_name='player',
            name='dob',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='player',
            name='team',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='crt.Team'),
        ),
    ]
