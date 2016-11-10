procedure InitializeComponent;
    begin
        self.button1 := new System.Windows.Forms.Button();
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.label1 := new System.Windows.Forms.Label();
        self.label2 := new System.Windows.Forms.Label();
        self.label3 := new System.Windows.Forms.Label();
        self.label4 := new System.Windows.Forms.Label();
        self.numericUpDown1 := new System.Windows.Forms.NumericUpDown();
        self.numericUpDown2 := new System.Windows.Forms.NumericUpDown();
        self.numericUpDown3 := new System.Windows.Forms.NumericUpDown();
        self.folderBrowserDialog1 := new System.Windows.Forms.FolderBrowserDialog();
        self.radioButton1 := new System.Windows.Forms.RadioButton();
        self.radioButton2 := new System.Windows.Forms.RadioButton();
        (System.ComponentModel.ISupportInitialize(self.numericUpDown1)).BeginInit();
        (System.ComponentModel.ISupportInitialize(self.numericUpDown2)).BeginInit();
        (System.ComponentModel.ISupportInitialize(self.numericUpDown3)).BeginInit();
        self.SuspendLayout();
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(148, 120);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(169, 54);
        self.button1.TabIndex := 0;
        self.button1.Text := 'Создать и сохранить';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click_EventHandler;
        // 
        // textBox1
        // 
        self.textBox1.Location := new System.Drawing.Point(132, 12);
        self.textBox1.Name := 'textBox1';
        self.textBox1.Size := new System.Drawing.Size(185, 20);
        self.textBox1.TabIndex := 5;
        // 
        // label1
        // 
        self.label1.Location := new System.Drawing.Point(12, 9);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(114, 23);
        self.label1.TabIndex := 6;
        self.label1.Text := 'Имя файла';
        // 
        // label2
        // 
        self.label2.Location := new System.Drawing.Point(12, 48);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(100, 23);
        self.label2.TabIndex := 7;
        self.label2.Text := 'Производная';
        // 
        // label3
        // 
        self.label3.Location := new System.Drawing.Point(12, 71);
        self.label3.Name := 'label3';
        self.label3.Size := new System.Drawing.Size(100, 23);
        self.label3.TabIndex := 8;
        self.label3.Text := 'Интегралы';
        // 
        // label4
        // 
        self.label4.Location := new System.Drawing.Point(12, 94);
        self.label4.Name := 'label4';
        self.label4.Size := new System.Drawing.Size(100, 23);
        self.label4.TabIndex := 9;
        self.label4.Text := 'Пределы';
        self.label4.Click += label4_Click_EventHandler;
        // 
        // numericUpDown1
        // 
        self.numericUpDown1.Location := new System.Drawing.Point(97, 48);
        self.numericUpDown1.Maximum := new System.Decimal(new System.Int32[4](5, 0, 0, 0));
        self.numericUpDown1.Name := 'numericUpDown1';
        self.numericUpDown1.Size := new System.Drawing.Size(45, 20);
        self.numericUpDown1.TabIndex := 10;
        // 
        // numericUpDown2
        // 
        self.numericUpDown2.Location := new System.Drawing.Point(97, 71);
        self.numericUpDown2.Maximum := new System.Decimal(new System.Int32[4](5, 0, 0, 0));
        self.numericUpDown2.Name := 'numericUpDown2';
        self.numericUpDown2.Size := new System.Drawing.Size(45, 20);
        self.numericUpDown2.TabIndex := 11;
        // 
        // numericUpDown3
        // 
        self.numericUpDown3.Location := new System.Drawing.Point(97, 94);
        self.numericUpDown3.Maximum := new System.Decimal(new System.Int32[4](5, 0, 0, 0));
        self.numericUpDown3.Name := 'numericUpDown3';
        self.numericUpDown3.Size := new System.Drawing.Size(45, 20);
        self.numericUpDown3.TabIndex := 12;
        // 
        // radioButton1
        // 
        self.radioButton1.Checked := true;
        self.radioButton1.Location := new System.Drawing.Point(12, 120);
        self.radioButton1.Name := 'radioButton1';
        self.radioButton1.Size := new System.Drawing.Size(130, 24);
        self.radioButton1.TabIndex := 14;
        self.radioButton1.TabStop := true;
        self.radioButton1.Text := 'В основной каталог';
        self.radioButton1.UseVisualStyleBackColor := true;
        self.radioButton1.CheckedChanged += radioButton1_CheckedChanged_EventHandler;
        // 
        // radioButton2
        // 
        self.radioButton2.Location := new System.Drawing.Point(12, 150);
        self.radioButton2.Name := 'radioButton2';
        self.radioButton2.Size := new System.Drawing.Size(130, 24);
        self.radioButton2.TabIndex := 15;
        self.radioButton2.Text := 'Выбрать папку';
        self.radioButton2.UseVisualStyleBackColor := true;
        self.radioButton2.CheckedChanged += radioButton2_CheckedChanged_EventHandler;
        // 
        // Form1
        // 
        self.AcceptButton := self.button1;
        self.ClientSize := new System.Drawing.Size(329, 183);
        self.Controls.Add(self.radioButton2);
        self.Controls.Add(self.radioButton1);
        self.Controls.Add(self.numericUpDown3);
        self.Controls.Add(self.numericUpDown2);
        self.Controls.Add(self.numericUpDown1);
        self.Controls.Add(self.label4);
        self.Controls.Add(self.label3);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.textBox1);
        self.Controls.Add(self.button1);
        self.Name := 'Form1';
        self.Text := 'Задачи';
        self.Load += Form1_Load_EventHandler;
        (System.ComponentModel.ISupportInitialize(self.numericUpDown1)).EndInit();
        (System.ComponentModel.ISupportInitialize(self.numericUpDown2)).EndInit();
        (System.ComponentModel.ISupportInitialize(self.numericUpDown3)).EndInit();
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
