<Style>
    .footer{
        height: 40px;
        width: 100%;
        padding-left: 20px;
        padding-right: 10px;
        background-color: #FFFFFF;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }
     .footer1 p{
        padding: 0;
        margin: 0;
        font-size: 11px;
        color: #676A6C;
    }
    .footer2 p{
        padding: 0;
        margin: 0;
        font-size: 13px;
        color: #676A6C;
    }
    .footer2 p strong{
        font-weight:700 ;
    }
</Style>


<div class="footer">
    <div class="footer1">
        <p>Copyright <strong>HR Partner </strong>© 2023. All Rights Reserved</p>
    </div>
    <div class="footer2">
        <p>Department:  <strong><?php echo $_SESSION['departament'] ; ?></strong></p>
    </div>
</div>