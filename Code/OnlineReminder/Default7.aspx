<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default7.aspx.cs" Inherits="Default7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" CellPadding="5" CellSpacing="5" 
            DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
            EnableModelValidation="True">
            <EditItemTemplate>
                Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                Day:
                <asp:TextBox ID="DayTextBox" runat="server" Text='<%# Bind("Day") %>' />
                <br />
                Month:
                <asp:TextBox ID="MonthTextBox" runat="server" Text='<%# Bind("Month") %>' />
                <br />
                Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Second:
                <asp:TextBox ID="SecondTextBox" runat="server" Text='<%# Bind("Second") %>' />
                <br />
                Minute:
                <asp:TextBox ID="MinuteTextBox" runat="server" Text='<%# Bind("Minute") %>' />
                <br />
                Hour:
                <asp:TextBox ID="HourTextBox" runat="server" Text='<%# Bind("Hour") %>' />
                <br />
                Status:
                <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Day:
                <asp:TextBox ID="DayTextBox" runat="server" Text='<%# Bind("Day") %>' />
                <br />
                Month:
                <asp:TextBox ID="MonthTextBox" runat="server" Text='<%# Bind("Month") %>' />
                <br />
                Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Second:
                <asp:TextBox ID="SecondTextBox" runat="server" Text='<%# Bind("Second") %>' />
                <br />
                Minute:
                <asp:TextBox ID="MinuteTextBox" runat="server" Text='<%# Bind("Minute") %>' />
                <br />
                Hour:
                <asp:TextBox ID="HourTextBox" runat="server" Text='<%# Bind("Hour") %>' />
                <br />
                Status:
                <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                Day:
                <asp:Label ID="DayLabel" runat="server" Text='<%# Bind("Day") %>' />
                <br />
                Month:
                <asp:Label ID="MonthLabel" runat="server" Text='<%# Bind("Month") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Second:
                <asp:Label ID="SecondLabel" runat="server" Text='<%# Bind("Second") %>' />
                <br />
                Minute:
                <asp:Label ID="MinuteLabel" runat="server" Text='<%# Bind("Minute") %>' />
                <br />
                Hour:
                <asp:Label ID="HourLabel" runat="server" Text='<%# Bind("Hour") %>' />
                <br />
                Status:
                <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="Id" 
            DataSourceID="SqlDataSource2" DefaultMode="Insert" EnableModelValidation="True">
            <EditItemTemplate>
                Id:
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                <br />
                To_Address:
                <asp:TextBox ID="To_AddressTextBox" runat="server" 
                    Text='<%# Bind("To_Address") %>' />
                <br />
                Subject:
                <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                <br />
                Body:
                <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                <br />
                Clock_Id:
                <asp:TextBox ID="Clock_IdTextBox" runat="server" 
                    Text='<%# Bind("Clock_Id") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                To_Address:
                <asp:TextBox ID="To_AddressTextBox" runat="server" 
                    Text='<%# Bind("To_Address") %>' />
                <br />
                Subject:
                <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                <br />
                Body:
                <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                <br />
                Clock_Id:
                <asp:TextBox ID="Clock_IdTextBox" runat="server" 
                    Text='<%# Bind("Clock_Id") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                To_Address:
                <asp:Label ID="To_AddressLabel" runat="server" 
                    Text='<%# Bind("To_Address") %>' />
                <br />
                Subject:
                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Bind("Subject") %>' />
                <br />
                Body:
                <asp:Label ID="BodyLabel" runat="server" Text='<%# Bind("Body") %>' />
                <br />
                Clock_Id:
                <asp:Label ID="Clock_IdLabel" runat="server" Text='<%# Bind("Clock_Id") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:reminderConnectionString %>" 
            DeleteCommand="DELETE FROM [Mails] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Mails] ([To_Address], [Subject], [Body], [Clock_Id]) VALUES (@To_Address, @Subject, @Body, @Clock_Id)" 
            ProviderName="<%$ ConnectionStrings:reminderConnectionString.ProviderName %>" 
            SelectCommand="SELECT [Id], [To_Address], [Subject], [Body], [Clock_Id] FROM [Mails]" 
            UpdateCommand="UPDATE [Mails] SET [To_Address] = @To_Address, [Subject] = @Subject, [Body] = @Body, [Clock_Id] = @Clock_Id WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="To_Address" Type="String" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Body" Type="String" />
                <asp:Parameter Name="Clock_Id" Type="Int64" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="To_Address" Type="String" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Body" Type="String" />
                <asp:Parameter Name="Clock_Id" Type="Int64" />
                <asp:Parameter Name="Id" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:reminderConnectionString %>" 
            DeleteCommand="DELETE FROM [Clock] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Clock] ([Day], [Month], [Year], [Second], [Minute], [Hour], [Status]) VALUES (@Day, @Month, @Year, @Second, @Minute, @Hour, @Status)" 
            ProviderName="<%$ ConnectionStrings:reminderConnectionString.ProviderName %>" 
            SelectCommand="SELECT [Id], [Day], [Month], [Year], [Second], [Minute], [Hour], [Status] FROM [Clock]" 
            UpdateCommand="UPDATE [Clock] SET [Day] = @Day, [Month] = @Month, [Year] = @Year, [Second] = @Second, [Minute] = @Minute, [Hour] = @Hour, [Status] = @Status WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Day" Type="Int32" />
                <asp:Parameter Name="Month" Type="Int32" />
                <asp:Parameter Name="Year" Type="Int32" />
                <asp:Parameter Name="Second" Type="Int32" />
                <asp:Parameter Name="Minute" Type="Int32" />
                <asp:Parameter Name="Hour" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Day" Type="Int32" />
                <asp:Parameter Name="Month" Type="Int32" />
                <asp:Parameter Name="Year" Type="Int32" />
                <asp:Parameter Name="Second" Type="Int32" />
                <asp:Parameter Name="Minute" Type="Int32" />
                <asp:Parameter Name="Hour" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Id" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
