﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DỰ_ÁN_NHẮC_VIỆC
{
    public partial class Job : UserControl
    {
        private MainForm _mainForm;
        private CongViec jobItem;

        public CongViec JobItem
        {
            get { return jobItem; }
            set { jobItem = value; }
        }


        public Job(CongViec jobItem)
        {
            InitializeComponent();

            this.JobItem = jobItem;

            ShowInfo();
        }
        public Job()
        {
            InitializeComponent();
        }
        public Job(MainForm mainForm)
        {
            InitializeComponent();
            _mainForm = mainForm;  // Gán MainForm hiện tại cho biến _mainForm
        }

        void ShowInfo()
        {
            //btnInfo.Text = JobItem.NameJob;
            //Them thuoc tinh ...
        }
       

        private event EventHandler edited;
        public event EventHandler Edited
        {
            add { edited += value; }
            remove { edited -= value; }
        }

        private event EventHandler deleted;
        public event EventHandler Deleted
        {
            add { deleted += value; }
            remove { deleted -= value; }
        }

        private void ctmsSua_Click(object sender, EventArgs e)
        {
            JobItem.NameJob = btnInfo.Text;
            //Them thuoc tinh ...
            if (edited != null)
            {
                edited(this, new EventArgs());
            }
        }

        private void ctmsXoa_Click(object sender, EventArgs e)
        {
            if (deleted != null)
            {
                deleted(this, new EventArgs());
            }
            MainForm mainForm = new MainForm();
           

        }

        public void btnInfo_Click(object sender, EventArgs e)
        {
            JobChild jobChild = new JobChild();
            _mainForm.pnlJobChild.Controls.Add(jobChild);

        }
    } 
}
